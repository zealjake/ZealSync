// UDP discovery server tests. All four cases exercise the server with a
// hardcoded TCP port (no real Listener), bound to 127.0.0.1:29981 to avoid
// colliding with anything on 29881.

#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <unistd.h>

#include <cassert>
#include <chrono>
#include <cstdio>
#include <cstring>
#include <string>
#include <thread>

#include <nlohmann/json.hpp>

#include "net/udp_discovery.h"

using zealsync::net::UdpDiscoveryServer;

namespace {

constexpr const char *kLoopback = "127.0.0.1";
constexpr std::uint16_t kTestUdpPort = 29981;
constexpr std::uint16_t kTestTcpPort = 12345;

struct TestClient {
    int sock = -1;

    TestClient() {
        sock = ::socket(AF_INET, SOCK_DGRAM, 0);
        assert(sock >= 0);

        sockaddr_in addr{};
        addr.sin_family = AF_INET;
        addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
        addr.sin_port = 0; // ephemeral
        const int rc = ::bind(sock, reinterpret_cast<sockaddr *>(&addr), sizeof(addr));
        assert(rc == 0);
    }

    ~TestClient() {
        if (sock >= 0) ::close(sock);
    }

    void set_recv_timeout(int millis) {
        timeval tv{};
        tv.tv_sec = millis / 1000;
        tv.tv_usec = (millis % 1000) * 1000;
        ::setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv));
    }

    void send_to_server(const std::string &payload) {
        sockaddr_in to{};
        to.sin_family = AF_INET;
        to.sin_port = htons(kTestUdpPort);
        ::inet_pton(AF_INET, kLoopback, &to.sin_addr);
        const ssize_t s = ::sendto(sock, payload.data(), payload.size(), 0,
                                   reinterpret_cast<sockaddr *>(&to), sizeof(to));
        assert(s == static_cast<ssize_t>(payload.size()));
    }

    // Returns nullopt-equivalent ("") on timeout.
    std::string recv_response(int timeout_ms = 500) {
        set_recv_timeout(timeout_ms);
        char buf[4096];
        const ssize_t n = ::recv(sock, buf, sizeof(buf), 0);
        if (n <= 0) return "";
        return std::string(buf, static_cast<std::size_t>(n));
    }
};

UdpDiscoveryServer make_server() {
    return UdpDiscoveryServer([] { return kTestTcpPort; }, kLoopback, kTestUdpPort);
}

void test_round_trip() {
    UdpDiscoveryServer server = make_server();
    assert(server.start());

    TestClient client;
    const auto probe = nlohmann::json{
        {"action", "discover"},
        {"protocolVersion", "1.0"},
    }.dump();
    client.send_to_server(probe);

    const std::string raw = client.recv_response();
    assert(!raw.empty() && "no response within timeout");
    const auto resp = nlohmann::json::parse(raw);
    assert(resp.value("status", "") == "done");
    assert(resp.contains("ip") && resp["ip"].is_string());
    assert(!resp["ip"].get<std::string>().empty());
    assert(resp.value("tcpPort", 0) == kTestTcpPort);
    assert(resp.contains("name") && resp["name"].is_string());
    assert(!resp["name"].get<std::string>().empty());

    server.stop();
    std::printf("ok: round-trip (ip=%s tcpPort=%d name=%s)\n",
                resp["ip"].get<std::string>().c_str(),
                resp["tcpPort"].get<int>(),
                resp["name"].get<std::string>().c_str());
}

void test_malformed_packet() {
    UdpDiscoveryServer server = make_server();
    assert(server.start());

    TestClient client;
    client.send_to_server("not json at all");
    const std::string raw = client.recv_response(200);
    assert(raw.empty() && "server should drop malformed packets silently");

    server.stop();
    std::printf("ok: malformed-packet (silent drop)\n");
}

void test_wrong_action() {
    UdpDiscoveryServer server = make_server();
    assert(server.start());

    TestClient client;
    const auto probe = nlohmann::json{
        {"action", "info"},
        {"protocolVersion", "1.0"},
    }.dump();
    client.send_to_server(probe);
    const std::string raw = client.recv_response(200);
    assert(raw.empty() && "non-discover action must be silently dropped on UDP");

    server.stop();
    std::printf("ok: wrong-action (silent drop)\n");
}

void test_protocol_version_mismatch() {
    UdpDiscoveryServer server = make_server();
    assert(server.start());

    TestClient client;
    const auto probe = nlohmann::json{
        {"action", "discover"},
        {"protocolVersion", "2.0"},
    }.dump();
    client.send_to_server(probe);
    const std::string raw = client.recv_response();
    assert(!raw.empty());
    const auto resp = nlohmann::json::parse(raw);
    assert(resp.value("status", "") == "error");
    assert(resp.value("code", "") == "protocolVersionMismatch");

    server.stop();
    std::printf("ok: protocol-version-mismatch (status=error code=protocolVersionMismatch)\n");
}

}

int main() {
    test_round_trip();
    test_malformed_packet();
    test_wrong_action();
    test_protocol_version_mismatch();
    std::printf("all udp discovery tests passed.\n");
    return 0;
}
