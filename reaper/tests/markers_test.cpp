// Unit tests for sync::markers_internal::build_response — the §7.2 JSON
// shape, color bit-stripping, sort order, colorGroups ordering, GUID
// normalisation, empty project. The REAPER-bound enumeration path
// (enum_markers, time_sig_at_time) is not exercised here; build_response
// takes pre-resolved data.

#include <cassert>
#include <cstdio>
#include <string>

#include <nlohmann/json.hpp>

#include "reaper_api/project.h"
#include "sync/markers.h"

using zealsync::sync::markers_internal::InputMarker;
using zealsync::sync::markers_internal::build_response;
using zealsync::reaper_api::normalize_guid;
using zealsync::reaper_api::strip_color_bit;

namespace {

InputMarker mk_marker(double t, const std::string &name, int raw_color,
                      int user_number, const std::string &guid) {
    return InputMarker{false, t, 0.0, name, raw_color, raw_color,
                       user_number, guid, 120.0};
}

InputMarker mk_region(double start, double end, const std::string &name,
                      int raw_color, int user_number, const std::string &guid) {
    return InputMarker{true, start, end, name, raw_color, raw_color,
                       user_number, guid, 120.0};
}

void test_strip_color_bit() {
    // High bit set: low 24 bits returned.
    assert(strip_color_bit(0x01FF0000) == 0x00FF0000);
    assert(strip_color_bit(0x0100FF00) == 0x0000FF00);
    // High bit clear: 0 (no custom color set).
    assert(strip_color_bit(0x00FF0000) == 0);
    assert(strip_color_bit(0x00000000) == 0);
}

void test_normalize_guid() {
    assert(normalize_guid("{A4F1E2C0-8B3D-4A5E-9C1B-6F0E8D2C4A7B}") ==
           "a4f1e2c08b3d4a5e9c1b6f0e8d2c4a7b");
    assert(normalize_guid("a4f1e2c08b3d4a5e9c1b6f0e8d2c4a7b") ==
           "a4f1e2c08b3d4a5e9c1b6f0e8d2c4a7b");
    assert(normalize_guid("") == "");
    // Already lowercase, no decoration: passthrough.
    assert(normalize_guid("aaaaaaaabbbbccccdddd000011112222") ==
           "aaaaaaaabbbbccccdddd000011112222");
}

void test_empty_project() {
    auto r = build_response({});
    assert(r["status"] == "done");
    assert(r["markers"].is_array() && r["markers"].empty());
    assert(r["colorGroups"].is_array() && r["colorGroups"].empty());
}

void test_sort_and_shape() {
    // Three markers, intentionally out-of-order; one region; mix of colored
    // and default-color.
    std::vector<InputMarker> in = {
        mk_marker(28.0, "Chorus", 0x0100FF00 /* green */, 2,
                  "b7e2d3f19c4e5a6b0d2c7f1e9d3b5a8c"),
        mk_marker(12.5, "Verse 1", 0x01FF0000 /* red */, 1,
                  "a4f1e2c08b3d4a5e9c1b6f0e8d2c4a7b"),
        mk_marker(50.0, "Bridge", 0 /* no custom color */, 3,
                  "c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1"),
        mk_region(60.0, 80.0, "OutroReg", 0x01FF0000 /* red */, 4,
                  "d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2"),
        mk_marker(20.0, "RedEarly", 0x01FF0000 /* red */, 5,
                  "e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3"),
    };

    auto r = build_response(in);
    assert(r["status"] == "done");

    // markers sorted by startTime ascending.
    const auto &m = r["markers"];
    assert(m.size() == 5);
    assert(m[0]["startTime"].get<double>() == 12.5);
    assert(m[1]["startTime"].get<double>() == 20.0);
    assert(m[2]["startTime"].get<double>() == 28.0);
    assert(m[3]["startTime"].get<double>() == 50.0);
    assert(m[4]["startTime"].get<double>() == 60.0);

    // Color stripped to 24-bit RGB on the wire.
    assert(m[0]["color"].get<int>() == 0xFF0000);
    assert(m[2]["color"].get<int>() == 0x00FF00); // Chorus, green
    assert(m[3]["color"].get<int>() == 0); // Bridge, no custom color
    assert(m[4]["color"].get<int>() == 0xFF0000);

    // endTime: null for points, number for regions.
    assert(m[0]["endTime"].is_null());
    assert(m[2]["endTime"].is_null());
    assert(m[4]["endTime"].is_number());
    assert(m[4]["endTime"].get<double>() == 80.0);

    // Region carries through isRegion-derived endTime; point markers don't
    // leak their unused endTime field.
    assert(m[0]["guid"] == "a4f1e2c08b3d4a5e9c1b6f0e8d2c4a7b");
    assert(m[0]["userNumber"].get<int>() == 1);
    assert(m[0]["bpmAtPosition"].get<double>() == 120.0);

    // colorGroups: descending by count, ties by ascending color.
    // Counts: red=3, green=1, default=1. Ties between green(0x00FF00) and
    // default(0) — default sorts first.
    const auto &cg = r["colorGroups"];
    assert(cg.size() == 3);
    assert(cg[0]["color"].get<int>() == 0xFF0000 && cg[0]["count"].get<int>() == 3);
    assert(cg[1]["color"].get<int>() == 0 && cg[1]["count"].get<int>() == 1);
    assert(cg[2]["color"].get<int>() == 0x00FF00 && cg[2]["count"].get<int>() == 1);
}

void test_stable_tie_break() {
    // Two markers at exactly the same startTime — input order is preserved.
    std::vector<InputMarker> in = {
        mk_marker(10.0, "First", 0x01FF0000, 1, "1111111111111111111111111111111a"),
        mk_marker(10.0, "Second", 0x01FF0000, 2, "2222222222222222222222222222222b"),
    };
    auto r = build_response(in);
    assert(r["markers"][0]["name"] == "First");
    assert(r["markers"][1]["name"] == "Second");
}

}

int main() {
    test_strip_color_bit();
    test_normalize_guid();
    test_empty_project();
    test_sort_and_shape();
    test_stable_tie_break();
    std::printf("markers_test: ok\n");
    return 0;
}
