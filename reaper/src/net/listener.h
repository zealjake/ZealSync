#ifndef ZEALSYNC_NET_LISTENER_H
#define ZEALSYNC_NET_LISTENER_H

#include <atomic>
#include <cstdint>
#include <thread>

#include "dispatcher.h"

namespace zealsync::net {

// Dev-default TCP port for M2–M6, picked to coexist with ZealServer on 29882.
// Overridden at runtime via the ZEALSYNC_TCP_PORT env var. M7 flips this back
// to 29882 when ZealServer retires.
constexpr std::uint16_t kTcpPort = 29892;

class Listener {
public:
    explicit Listener(Dispatcher &dispatcher);
    ~Listener();

    bool start(std::uint16_t port = kTcpPort);
    void stop();

    // Port the listener actually bound to. 0 if start() has not been called
    // (or it failed). UDP discovery reads this when building the response —
    // single source of truth, even if a future port-fallback path lands.
    std::uint16_t bound_port() const { return bound_port_.load(); }

private:
    void run();

    Dispatcher &dispatcher_;
    std::atomic<bool> stop_{false};
    std::atomic<std::uint16_t> bound_port_{0};
    std::thread thread_;
    int listen_fd_ = -1;
};

}

#endif
