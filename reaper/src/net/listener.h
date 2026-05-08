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

private:
    void run();

    Dispatcher &dispatcher_;
    std::atomic<bool> stop_{false};
    std::thread thread_;
    int listen_fd_ = -1;
};

}

#endif
