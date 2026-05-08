#include <cstdio>
#include <memory>

#include "net/dispatcher.h"
#include "net/listener.h"
#include "sync/info_handler.h"

#ifndef ZEALSYNC_STANDALONE
#include "reaper_plugin_compat.h"
#endif

namespace {

zealsync::net::Dispatcher g_dispatcher;
std::unique_ptr<zealsync::net::Listener> g_listener;

void register_handlers() {
    zealsync::sync::register_info_handler(g_dispatcher);
}

}

#ifndef ZEALSYNC_STANDALONE

namespace {
ShowConsoleMsg_t g_ShowConsoleMsg = nullptr;

void log(const char *msg) {
    if (g_ShowConsoleMsg) g_ShowConsoleMsg(msg);
    std::fprintf(stderr, "%s", msg);
}
}

extern "C" REAPER_PLUGIN_DLL_EXPORT int ReaperPluginEntry(
    REAPER_PLUGIN_HINSTANCE /*hInstance*/, reaper_plugin_info_t *rec) {
    if (!rec) {
        if (g_listener) {
            g_listener->stop();
            g_listener.reset();
        }
        return 0;
    }
    if (rec->caller_version != 0x20E) {
        return 0;
    }
    g_ShowConsoleMsg = reinterpret_cast<ShowConsoleMsg_t>(rec->GetFunc("ShowConsoleMsg"));
    log("ZealSync: loading...\n");

    register_handlers();
    g_listener = std::make_unique<zealsync::net::Listener>(g_dispatcher);
    if (!g_listener->start()) {
        log("ZealSync: failed to start TCP listener.\n");
        return 0;
    }
    log("ZealSync: TCP listener bound on port 29882.\n");
    return 1;
}

#else

#include <csignal>
#include <chrono>
#include <thread>

namespace {
std::atomic<bool> g_should_exit{false};
void on_signal(int) { g_should_exit.store(true); }
}

int main(int argc, char **argv) {
    std::signal(SIGINT, on_signal);
    std::signal(SIGTERM, on_signal);

    std::uint16_t port = zealsync::net::kTcpPort;
    if (argc >= 2) port = static_cast<std::uint16_t>(std::atoi(argv[1]));

    register_handlers();
    zealsync::net::Listener listener(g_dispatcher);
    if (!listener.start(port)) {
        std::fprintf(stderr, "ZealSync standalone: failed to bind.\n");
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
