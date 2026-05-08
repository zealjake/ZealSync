#include "project.h"

#include <vector>

// All these symbols come from REAPERAPI_LoadAPI in main.cpp. The corresponding
// REAPERAPI_WANT_* lines live there too — keep this file in sync with that
// list when adding new wrappers.
#include "reaper_plugin.h"
#include "reaper_plugin_functions.h"

namespace zealsync::reaper_api {

namespace {

// EnumProjects(-1, ...) returns the *current* project. The cast keeps callers
// from sprinkling `nullptr` literals around for "current project" parameters.
ReaProject *current_project() {
    return EnumProjects(-1, nullptr, 0);
}

// Read a NUL-terminated C-string from a REAPER getter into std::string,
// growing the buffer if the API ever needs more. 1 KiB covers project names
// and paths comfortably; the loop is defence in depth.
template <typename Getter>
std::string read_string_via_buffer(Getter getter) {
    std::vector<char> buf(1024);
    for (;;) {
        getter(buf.data(), static_cast<int>(buf.size()));
        // REAPER's *_OutOptional getters NUL-terminate inside the buffer; if
        // the last byte we wrote is non-NUL, the string was truncated.
        if (buf.back() == '\0') {
            return std::string(buf.data());
        }
        buf.resize(buf.size() * 2);
        if (buf.size() > 64 * 1024) {
            // Sanity cap. Refuse to keep growing — caller gets a truncated
            // string.
            buf.back() = '\0';
            return std::string(buf.data());
        }
    }
}

}

bool enum_projects() {
    return current_project() != nullptr;
}

std::string get_project_name() {
    auto *proj = current_project();
    return read_string_via_buffer([&](char *out, int sz) {
        GetProjectName(proj, out, sz);
    });
}

std::string get_project_path() {
    // EnumProjects' second/third args fill in the project filename for the
    // requested index. -1 = current project.
    std::vector<char> buf(1024);
    for (;;) {
        EnumProjects(-1, buf.data(), static_cast<int>(buf.size()));
        if (buf.back() == '\0') return std::string(buf.data());
        buf.resize(buf.size() * 2);
        if (buf.size() > 64 * 1024) {
            buf.back() = '\0';
            return std::string(buf.data());
        }
    }
}

double get_project_length() {
    return GetProjectLength(current_project());
}

double get_time_offset() {
    return GetProjectTimeOffset(current_project(), false);
}

std::pair<double, bool> get_frame_rate_and_dropframe() {
    bool drop = false;
    const double fps = TimeMap_curFrameRate(current_project(), &drop);
    return {fps, drop};
}

std::optional<std::string> get_proj_ext_state(const char *ns, const char *key) {
    // GetProjExtState returns the length needed when the buffer is too small.
    // Start small, grow if the API tells us to.
    std::vector<char> buf(256);
    for (;;) {
        const int needed = GetProjExtState(current_project(), ns, key,
                                           buf.data(),
                                           static_cast<int>(buf.size()));
        if (needed == 0) {
            return std::nullopt; // key absent
        }
        if (needed > 0 && static_cast<size_t>(needed) < buf.size()) {
            std::string out(buf.data());
            if (out.empty()) return std::nullopt;
            return out;
        }
        // Need bigger buffer.
        buf.resize(static_cast<size_t>(needed > 0 ? needed + 1 : buf.size() * 2));
        if (buf.size() > 64 * 1024) return std::nullopt;
    }
}

void set_proj_ext_state(const char *ns, const char *key, const char *value) {
    SetProjExtState(current_project(), ns, key, value);
}

void mark_project_dirty() {
    MarkProjectDirty(current_project());
}

}
