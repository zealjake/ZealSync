#ifndef ZEALSYNC_NET_UDP_DISCOVERY_H
#define ZEALSYNC_NET_UDP_DISCOVERY_H

// UDP discovery server per WIRE_PROTOCOL §6. Bare JSON in/out — no MC/MS
// framing, no length prefix. Listens on UDP 29881, replies to `discover`
// probes via unicast with our IP, the TCP listener's port, and our
// hostname.
//
// Has its own thread and zero coupling to the main-thread queue or the
// REAPER API. The TCP port is read on demand via a getter so the server
// always reports the listener's *actually-bound* port, not a constant.

#include <atomic>
#include <cstdint>
#include <functional>
#include <string>
#include <thread>

namespace zealsync::net {

// Fixed across dev and prod (§1, §6.2). Unlike the TCP port, no env var.
constexpr std::uint16_t kUdpDiscoveryPort = 29881;

class UdpDiscoveryServer {
public:
    using TcpPortGetter = std::function<std::uint16_t()>;

    UdpDiscoveryServer(TcpPortGetter tcp_port_getter,
                       const std::string &bind_addr = "0.0.0.0",
                       std::uint16_t udp_port = kUdpDiscoveryPort);
    ~UdpDiscoveryServer();

    bool start();
    void stop();

private:
    void run();

    TcpPortGetter tcp_port_getter_;
    std::string bind_addr_;
    std::uint16_t udp_port_;
    int sock_ = -1;
    std::atomic<bool> stop_{false};
    std::thread thread_;
};

}

#endif
