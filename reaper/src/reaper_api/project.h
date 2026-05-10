#ifndef ZEALSYNC_REAPER_API_PROJECT_H
#define ZEALSYNC_REAPER_API_PROJECT_H

// Project-scoped REAPER API wrappers. EVERY function in here must be called
// from the main thread. The listener thread marshals work via
// net::main_thread_queue. Calling these from any other thread is undefined
// behaviour — REAPER will crash or corrupt state.

#include <optional>
#include <string>
#include <utility>
#include <vector>

namespace zealsync::reaper_api {

// Wire-format marker entry: one row per marker or region. Colors are the raw
// REAPER 32-bit values with the "custom-color" high bit (0x01000000) still
// set; strip via strip_color_bit() before transmitting.
struct MarkerEntry {
    bool isRegion;
    double startTime;
    double endTime;            // only meaningful when isRegion
    std::string name;
    int customColor;           // raw I_CUSTOMCOLOR (high bit set if custom)
    int displayedColor;        // raw I_DISPLAYEDCOLOR (high bit set if custom)
    int userNumber;            // I_NUMBER (visible in REAPER's ruler)
    std::string guid;          // canonical 32-char lowercase hex, no braces/dashes
};

// {bpm, numerator, denominator}. §7.4 (M6, tempo) reuses this triple
// unchanged, so we shape it now (D14) rather than returning BPM only.
struct TimeSigAtTime {
    double bpm;
    int numerator;
    int denominator;
};

// EnumProjects(-1, ...) — returns true if there is a current project loaded.
bool enum_projects();

// Reaper project name without ".rpp". GetProjectName(EnumProjects(-1), ...).
std::string get_project_name();

// Absolute path to the .rpp file. From EnumProjects(-1)'s out-arg.
std::string get_project_path();

// GetProjectLength(0).
double get_project_length();

// GetProjectTimeOffset(-1, false).
double get_time_offset();

// {fps, dropFrame}. TimeMap_curFrameRate(-1, &drop).
std::pair<double, bool> get_frame_rate_and_dropframe();

// GetProjExtState(-1, ns, key, ...). std::nullopt when absent or empty.
std::optional<std::string> get_proj_ext_state(const char *ns, const char *key);

// SetProjExtState(-1, ns, key, value).
void set_proj_ext_state(const char *ns, const char *key, const char *value);

// MarkProjectDirty(-1).
void mark_project_dirty();

// Enumerate all markers and regions on the current project, in REAPER's
// natural enumeration order (matches GetRegionOrMarker(proj, i, "")).
std::vector<MarkerEntry> enum_markers();

// Strip REAPER's 0x01000000 "custom color set" high bit. Returns 0 if no
// custom color is set (the high bit was clear). Wire format is plain 24-bit
// RGB per WIRE_PROTOCOL §7.2.3.
//
// Inlined: pure logic, called from unit tests that don't link the REAPER API.
inline int strip_color_bit(int raw) {
    if ((raw & 0x01000000) == 0) return 0;
    return raw & 0x00FFFFFF;
}

// Normalise a REAPER GUID string ("{XXXXXXXX-XXXX-...-XXXXXXXXXXXX}") to
// 32-char lowercase hex with no braces or dashes. Matches the projectGUID
// format from §7.1.1 and the marker guid format from §7.2.4. Empty input
// returns an empty string.
//
// Inlined: pure logic, called from unit tests that don't link the REAPER API.
inline std::string normalize_guid(const std::string &guid_with_braces) {
    std::string out;
    out.reserve(32);
    for (char c : guid_with_braces) {
        if (c == '{' || c == '}' || c == '-') continue;
        if (c >= 'A' && c <= 'Z') c = static_cast<char>(c - 'A' + 'a');
        out.push_back(c);
    }
    return out;
}

// {bpm, numerator, denominator} at a given seconds offset. Walks the tempo
// map; returns the project default if no tempo markers are present.
TimeSigAtTime time_sig_at_time(double seconds);

}

#endif
