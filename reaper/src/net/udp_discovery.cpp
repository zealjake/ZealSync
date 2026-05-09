#include "udp_discovery.h"

#include <arpa/inet.h>
#include <errno.h>
#include <netinet/in.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>

#include <cstdio>
#include <cstring>
#include <string>

#include <nlohmann/json.hpp>

#include "protocol.h"
#include "../version.h"

namespace zealsync::net {

namespace {

constexpr std::size_t kRecvBufferSize = 4096;

// Open a transient UDP socket, connect() it to the prober (no datagram is
// sent — connect() on an unconnected UDP socket only sets the default peer
// and triggers source-address selection inside the kernel), then read the
// chosen local end. Correct on multi-NIC hosts where our listener bound
// 0.0.0.0.
std::string recover_outgoing_ip(const sockaddr_in &peer) {
    int probe = ::socket(AF_INET, SOCK_DGRAM, 0);
    if (probe < 0) return "";
    if (::connect(probe, reinterpret_cast<const sockaddr *>(&peer), sizeof(peer)) < 0) {
        ::close(probe);
        return "";
    }
    sockaddr_in local{};
    socklen_t len = sizeof(local);
    if (::getsockname(probe, reinterpret_cast<sockaddr *>(&local), &len) < 0) {
        ::close(probe);
        return "";
    }
    ::close(probe);
    char buf[INET_ADDRSTRLEN] = {0};
    ::inet_ntop(AF_INET, &local.sin_addr, buf, sizeof(buf));
    return std::string(buf);
}

std::string read_hostname() {
    char buf[256];
    if (::gethostname(buf, sizeof(buf)) != 0) {
        return "unknown";
    }
    buf[sizeof(buf) - 1] = '\0';
    return std::string(buf);
}

// Send bare JSON (no framing) back to the prober.
void reply(int sock, const sockaddr_in &peer, const nlohmann::json &body) {
    const std::string out = body.dump();
    ::sendto(sock, out.data(), out.size(), 0,
             reinterpret_cast<const sockaddr *>(&peer), sizeof(peer));
}

}

UdpDiscoveryServer::UdpDiscoveryServer(TcpPortGetter tcp_port_getter,
                                       const std::string &bind_addr,
                                       std::uint16_t udp_port)
    : tcp_port_getter_(std::move(tcp_port_getter)),
      bind_addr_(bind_addr),
      udp_port_(udp_port) {}

UdpDiscoveryServer::~UdpDiscoveryServer() {
    stop();
}

bool UdpDiscoveryServer::start() {
    sock_ = ::socket(AF_INET, SOCK_DGRAM, 0);
    if (sock_ < 0) {
        std::fprintf(stderr, "ZealSync: UDP socket() failed: %s\n", strerror(errno));
        return false;
    }

    int yes = 1;
    ::setsockopt(sock_, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(yes));

    sockaddr_in addr{};
    addr.sin_family = AF_INET;
    addr.sin_port = htons(udp_port_);
    if (::inet_pton(AF_INET, bind_addr_.c_str(), &addr.sin_addr) != 1) {
        std::fprintf(stderr, "ZealSync: UDP inet_pton(%s) failed.\n", bind_addr_.c_str());
        ::close(sock_);
        sock_ = -1;
        return false;
    }
    if (::bind(sock_, reinterpret_cast<sockaddr *>(&addr), sizeof(addr)) < 0) {
        std::fprintf(stderr, "ZealSync: UDP bind(%s:%u) failed: %s\n",
                     bind_addr_.c_str(), udp_port_, strerror(errno));
        ::close(sock_);
        sock_ = -1;
        return false;
    }

    stop_.store(false);
    thread_ = std::thread([this]() { run(); });
    return true;
}

void UdpDiscoveryServer::stop() {
    if (!thread_.joinable()) return;
    stop_.store(true);
    if (sock_ >= 0) {
        // Break the blocking recvfrom: shutdown isn't supported on UDP on
        // every platform, so close and let the recvfrom path see EBADF.
        ::close(sock_);
        sock_ = -1;
    }
    thread_.join();
}

void UdpDiscoveryServer::run() {
    char buf[kRecvBufferSize];

    while (!stop_.load()) {
        sockaddr_in peer{};
        socklen_t peer_len = sizeof(peer);
        ssize_t n = ::recvfrom(sock_, buf, sizeof(buf), 0,
                               reinterpret_cast<sockaddr *>(&peer), &peer_len);
        if (n < 0) {
            if (stop_.load()) break;
            if (errno == EINTR) continue;
            // Bad socket (closed during shutdown) or other error — bail.
            break;
        }
        if (n == 0) continue;

        // Defensive null-terminate for the parser — we don't trust the body.
        std::string body(buf, static_cast<std::size_t>(n));

        nlohmann::json req;
        try {
            req = nlohmann::json::parse(body);
        } catch (...) {
            // Junk on the wire — silent drop per §6 (broadcast port,
            // unrelated traffic is normal).
            continue;
        }
        if (!req.is_object()) continue;

        // §6.5: only `discover` is recognised on UDP. Any other action
        // shape gets dropped silently — no UDP reply for unknown verbs.
        if (!req.contains("action") || !req["action"].is_string() ||
            req["action"].get<std::string>() != "discover") {
            continue;
        }

        // Protocol-version check shared with the TCP dispatcher (§6.3:
        // "All other dispatcher errors apply equally over UDP").
        if (!req.contains("protocolVersion") || !req["protocolVersion"].is_string()) {
            reply(sock_, peer, nlohmann::json{
                {"status", "error"},
                {"code", "invalidRequest"},
                {"message", "discover: missing or non-string 'protocolVersion'."},
            });
            continue;
        }
        const auto client_version = req["protocolVersion"].get<std::string>();
        if (!is_compatible_protocol_version(client_version)) {
            reply(sock_, peer, nlohmann::json{
                {"status", "error"},
                {"code", "protocolVersionMismatch"},
                {"message", "Client protocol version " + client_version +
                                " is incompatible with server " +
                                std::string(kProtocolVersion) + "."},
            });
            continue;
        }

        const std::string ip = recover_outgoing_ip(peer);
        const std::uint16_t tcp_port = tcp_port_getter_ ? tcp_port_getter_() : 0;
        reply(sock_, peer, nlohmann::json{
            {"status", "done"},
            {"ip", ip},
            {"tcpPort", tcp_port},
            {"name", read_hostname()},
        });
    }
}

}
