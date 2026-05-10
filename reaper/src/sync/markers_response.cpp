// build_response — pure JSON shape for the §7.2 markers verb. Split from
// markers.cpp so unit tests can link this TU alone (markers.cpp pulls in the
// REAPER-bound enum_markers / time_sig_at_time wrappers via the main-thread
// closure).

#include "markers.h"

#include <algorithm>
#include <map>

#include "../reaper_api/project.h"

namespace zealsync::sync::markers_internal {

nlohmann::json build_response(const std::vector<InputMarker> &input) {
    // Stable sort by startTime ascending. Ties keep enumeration order, per
    // §7.2.1 ("ties broken by REAPER's marker enumeration order, stable
    // within one response").
    std::vector<InputMarker> sorted = input;
    std::stable_sort(sorted.begin(), sorted.end(),
                     [](const InputMarker &a, const InputMarker &b) {
                         return a.startTime < b.startTime;
                     });

    nlohmann::json markers = nlohmann::json::array();
    std::map<int, int> color_counts;
    for (const auto &m : sorted) {
        const int wire_color = reaper_api::strip_color_bit(m.customColorRaw);
        const int wire_displayed = reaper_api::strip_color_bit(m.displayedColorRaw);

        nlohmann::json entry = {
            {"guid", m.guid},
            {"name", m.name},
            {"startTime", m.startTime},
            {"endTime", m.isRegion ? nlohmann::json(m.endTime) : nlohmann::json(nullptr)},
            {"color", wire_color},
            {"displayedColor", wire_displayed},
            {"userNumber", m.userNumber},
            {"bpmAtPosition", m.bpmAtPosition},
        };
        markers.push_back(std::move(entry));
        color_counts[wire_color] += 1;
    }

    // colorGroups: descending by count, ties broken by ascending color
    // value (§7.2.2).
    struct Group { int color; int count; };
    std::vector<Group> groups;
    groups.reserve(color_counts.size());
    for (const auto &kv : color_counts) {
        groups.push_back({kv.first, kv.second});
    }
    std::stable_sort(groups.begin(), groups.end(),
                     [](const Group &a, const Group &b) {
                         if (a.count != b.count) return a.count > b.count;
                         return a.color < b.color;
                     });

    nlohmann::json color_groups = nlohmann::json::array();
    for (const auto &g : groups) {
        color_groups.push_back({{"color", g.color}, {"count", g.count}});
    }

    return nlohmann::json{
        {"status", "done"},
        {"markers", std::move(markers)},
        {"colorGroups", std::move(color_groups)},
    };
}

}
