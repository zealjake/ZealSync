#ifndef ZEALSYNC_NET_LISTENER_H
#define ZEALSYNC_NET_LISTENER_H

#include <atomic>
#include <cstdint>
#include <thread>

#include "dispatcher.h"

namespace zealsync::net {

constexpr std::uint16_t kTcpPort = 29882;

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
