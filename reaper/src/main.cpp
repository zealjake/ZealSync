#include <cstdio>
#include <cstdlib>
#include <memory>
#include <string>

#include "net/dispatcher.h"
#include "net/listener.h"
#include "sync/info_handler.h"

#ifndef ZEALSYNC_STANDALONE

#define REAPERAPI_IMPLEMENT
#define REAPERAPI_MINIMAL
#define REAPERAPI_WANT_ShowConsoleMsg

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

void register_handlers() {
    zealsync::sync::register_info_handler(g_dispatcher);
}

}

extern "C" REAPER_PLUGIN_DLL_EXPORT int REAPER_PLUGIN_ENTRYPOINT(
    REAPER_PLUGIN_HINSTANCE /*hInstance*/, reaper_plugin_info_t *rec) {
    if (!rec) {
        if (g_listener) {
            g_listener->stop();
            g_listener.reset();
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
    const std::uint16_t port = resolve_port();
    g_listener = std::make_unique<zealsync::net::Listener>(g_dispatcher);
    if (!g_listener->start(port)) {
        char msg[128];
        std::snprintf(msg, sizeof(msg),
                      "ZealSync: failed to start TCP listener on %u.\n", port);
        log(msg);
        return 0;
    }
    {
        char msg[128];
        std::snprintf(msg, sizeof(msg),
                      "ZealSync: TCP listener bound on port %u.\n", port);
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
    zealsync::sync::register_info_handler(g_dispatcher);
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
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }
    listener.stop();
    return 0;
}

#endif
