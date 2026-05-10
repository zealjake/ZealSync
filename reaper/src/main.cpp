#include <cstdio>
#include <cstdlib>
#include <memory>

#include "net/dispatcher.h"
#include "net/listener.h"
#include "net/main_thread_queue.h"
#include "net/udp_discovery.h"
#include "sync/info.h"
#include "sync/markers.h"

#ifndef ZEALSYNC_STANDALONE

#define REAPERAPI_IMPLEMENT
#define REAPERAPI_MINIMAL
// Sorted alphabetically. Each line is a function the extension calls
// somewhere — main.cpp, reaper_api/, or a handler. Adding a function call
// without adding a WANT_ line links fine but crashes at runtime when REAPER
// fails to populate the function pointer.
#define REAPERAPI_WANT_EnumProjects
#define REAPERAPI_WANT_GetNumRegionsOrMarkers
#define REAPERAPI_WANT_GetProjExtState
#define REAPERAPI_WANT_GetProjectLength
#define REAPERAPI_WANT_GetProjectName
#define REAPERAPI_WANT_GetProjectTimeOffset
#define REAPERAPI_WANT_GetRegionOrMarker
#define REAPERAPI_WANT_GetRegionOrMarkerInfo_Value
#define REAPERAPI_WANT_GetSetRegionOrMarkerInfo_String
#define REAPERAPI_WANT_MarkProjectDirty
#define REAPERAPI_WANT_SetProjExtState
#define REAPERAPI_WANT_ShowConsoleMsg
#define REAPERAPI_WANT_TimeMap_GetTimeSigAtTime
#define REAPERAPI_WANT_TimeMap_curFrameRate
#define REAPERAPI_WANT_plugin_register

#include "reaper_plugin.h"
#include "reaper_plugin_functions.h"

namespace {

void log(const char *msg) {
    if (ShowConsoleMsg) ShowConsoleMsg(msg);
    std::fprintf(stderr, "%s", msg);
}

std::uint16_t resolve_port() {
    if (const char *env = std::getenv("ZEALSYNC_TCP_PORT")) {
        int p = std::atoi(env);
        if (p > 0 && p <= 65535) return static_cast<std::uint16_t>(p);
    }
    return zealsync::net::kTcpPort;
}

zealsync::net::Dispatcher g_dispatcher;
std::unique_ptr<zealsync::net::Listener> g_listener;
std::unique_ptr<zealsync::net::UdpDiscoveryServer> g_udp_discovery;

// REAPER's "timer" registration takes a void(*)(). Drains the main-thread
// queue every tick. Exceptions inside closures are caught by the closure
// itself; this wrapper guards against any escape into REAPER's timer pump.
void main_thread_drain_tick() {
    try {
        zealsync::net::main_thread_queue().drain();
    } catch (...) {
        std::fprintf(stderr, "ZealSync: drain-tick caught unknown exception.\n");
    }
}

void register_handlers() {
    zealsync::sync::register_info_handler(g_dispatcher);
    zealsync::sync::register_markers_handler(g_dispatcher);
}

}

extern "C" REAPER_PLUGIN_DLL_EXPORT int REAPER_PLUGIN_ENTRYPOINT(
    REAPER_PLUGIN_HINSTANCE /*hInstance*/, reaper_plugin_info_t *rec) {
    if (!rec) {
        // Unload. Stop accepting connections (UDP first so it can't reference
        // a torn-down listener), unregister timer.
        if (g_udp_discovery) {
            g_udp_discovery->stop();
            g_udp_discovery.reset();
        }
        if (g_listener) {
            g_listener->stop();
            g_listener.reset();
        }
        if (plugin_register) {
            plugin_register("-timer", reinterpret_cast<void *>(&main_thread_drain_tick));
        }
        return 0;
    }
    if (rec->caller_version != REAPER_PLUGIN_VERSION) {
        return 0;
    }
    if (REAPERAPI_LoadAPI(rec->GetFunc) != 0) {
        std::fprintf(stderr, "ZealSync: REAPERAPI_LoadAPI reported missing functions.\n");
        return 0;
    }
    log("ZealSync: loading...\n");

    register_handlers();

    // Drain the main-thread queue on REAPER's timer tick. Per WIRE_PROTOCOL
    // §5 (wait continuation), handlers defer REAPER work onto this queue
    // because the REAPER API is main-thread-only.
    plugin_register("timer", reinterpret_cast<void *>(&main_thread_drain_tick));

    const std::uint16_t port = resolve_port();
    g_listener = std::make_unique<zealsync::net::Listener>(g_dispatcher);
    if (!g_listener->start(port)) {
        char msg[128];
        std::snprintf(msg, sizeof(msg),
                      "ZealSync: failed to start TCP listener on %u.\n", port);
        log(msg);
        plugin_register("-timer", reinterpret_cast<void *>(&main_thread_drain_tick));
        return 0;
    }
    {
        char msg[128];
        std::snprintf(msg, sizeof(msg),
                      "ZealSync: TCP listener bound on port %u.\n", port);
        log(msg);
    }

    // UDP discovery reads the listener's *bound* port on every probe, so
    // any future port-fallback path is reflected automatically.
    g_udp_discovery = std::make_unique<zealsync::net::UdpDiscoveryServer>(
        [] { return g_listener ? g_listener->bound_port() : 0; });
    if (!g_udp_discovery->start()) {
        log("ZealSync: failed to start UDP discovery server.\n");
        // Keep the TCP listener running — discovery is a convenience, not
        // a hard requirement. The MA3 plugin can still use a persisted
        // endpoint.
        g_udp_discovery.reset();
    } else {
        char msg[128];
        std::snprintf(msg, sizeof(msg),
                      "ZealSync: UDP discovery bound on port %u.\n",
                      zealsync::net::kUdpDiscoveryPort);
        log(msg);
    }
    return 1;
}

#else // ZEALSYNC_STANDALONE — headless test build, no REAPER linkage

#include <atomic>
#include <chrono>
#include <csignal>
#include <thread>

namespace {

zealsync::net::Dispatcher g_dispatcher;

void register_handlers() {
    // Standalone build does not register the info handler — info needs the
    // REAPER API. Net-layer handlers (none yet) would register here.
}

std::atomic<bool> g_should_exit{false};
void on_signal(int) { g_should_exit.store(true); }

}

int main(int argc, char **argv) {
    std::signal(SIGINT, on_signal);
    std::signal(SIGTERM, on_signal);

    std::uint16_t port = zealsync::net::kTcpPort;
    if (const char *env = std::getenv("ZEALSYNC_TCP_PORT")) {
        int p = std::atoi(env);
        if (p > 0 && p <= 65535) port = static_cast<std::uint16_t>(p);
    }
    if (argc >= 2) port = static_cast<std::uint16_t>(std::atoi(argv[1]));

    register_handlers();
    zealsync::net::Listener listener(g_dispatcher);
    if (!listener.start(port)) {
        std::fprintf(stderr, "ZealSync standalone: failed to bind %u.\n", port);
        return 1;
    }
    std::fprintf(stderr, "ZealSync standalone: listening on %u. Ctrl-C to stop.\n", port);
    while (!g_should_exit.load()) {
        // Drain the queue periodically so anything enqueued by deferred
        // handlers actually runs. Real REAPER hosts this through the
        // plugin_register("timer", ...) callback.
        zealsync::net::main_thread_queue().drain();
        std::this_thread::sleep_for(std::chrono::milliseconds(50));
    }
    listener.stop();
    return 0;
}

#endif
