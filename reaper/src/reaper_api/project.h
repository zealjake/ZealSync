#ifndef ZEALSYNC_REAPER_API_PROJECT_H
#define ZEALSYNC_REAPER_API_PROJECT_H

// Project-scoped REAPER API wrappers. EVERY function in here must be called
// from the main thread. The listener thread marshals work via
// net::main_thread_queue. Calling these from any other thread is undefined
// behaviour — REAPER will crash or corrupt state.

#include <optional>
#include <string>
#include <utility>

namespace zealsync::reaper_api {

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

}

#endif
