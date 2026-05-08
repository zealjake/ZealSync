// M1 carve-out. Forward-declares the minimum surface from REAPER's
// reaper_plugin.h that we need to register the extension and call
// ShowConsoleMsg, without dragging in WDL/swell.
//
// M2 vendors WDL and replaces this with the upstream reaper_plugin.h /
// reaper_plugin_functions.h. See reaper/README.md.

#ifndef ZEALSYNC_REAPER_PLUGIN_COMPAT_H
#define ZEALSYNC_REAPER_PLUGIN_COMPAT_H

#ifdef __cplusplus
extern "C" {
#endif

typedef struct reaper_plugin_info_t {
    int caller_version;
    void *hwnd_main;
    int (*Register)(const char *name, void *infostruct);
    void *(*GetFunc)(const char *name);
} reaper_plugin_info_t;

typedef void (*ShowConsoleMsg_t)(const char *msg);

#define REAPER_PLUGIN_DLL_EXPORT __attribute__((visibility("default")))
#define REAPER_PLUGIN_HINSTANCE void *

#ifdef __cplusplus
}
#endif

#endif
