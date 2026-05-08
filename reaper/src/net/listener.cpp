#include "listener.h"

#include <arpa/inet.h>
#include <errno.h>
#include <fcntl.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <unistd.h>

#include <cstdio>

#include "framing.h"

namespace zealsync::net {

Listener::Listener(Dispatcher &dispatcher) : dispatcher_(dispatcher) {}

Listener::~Listener() {
    stop();
}

bool Listener::start(std::uint16_t port) {
    listen_fd_ = ::socket(AF_INET, SOCK_STREAM, 0);
    if (listen_fd_ < 0) {
        std::fprintf(stderr, "ZealSync: socket() failed: %s\n", strerror(errno));
        return false;
    }

    int yes = 1;
    ::setsockopt(listen_fd_, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(yes));

    sockaddr_in addr{};
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = htonl(INADDR_ANY);
    addr.sin_port = htons(port);
    if (::bind(listen_fd_, reinterpret_cast<sockaddr *>(&addr), sizeof(addr)) < 0) {
        std::fprintf(stderr, "ZealSync: bind(%u) failed: %s\n", port, strerror(errno));
        ::close(listen_fd_);
        listen_fd_ = -1;
        return false;
    }
    if (::listen(listen_fd_, 8) < 0) {
        std::fprintf(stderr, "ZealSync: listen() failed: %s\n", strerror(errno));
        ::close(listen_fd_);
        listen_fd_ = -1;
        return false;
    }

    bound_port_.store(port);
    stop_.store(false);
    thread_ = std::thread([this]() { run(); });
    return true;
}

void Listener::stop() {
    if (!thread_.joinable()) return;
    stop_.store(true);
    if (listen_fd_ >= 0) {
        ::shutdown(listen_fd_, SHUT_RDWR);
        ::close(listen_fd_);
        listen_fd_ = -1;
    }
    thread_.join();
    bound_port_.store(0);
}

void Listener::run() {
    constexpr char kClientMagic[2] = {'M', 'C'};
    constexpr char kServerMagic[2] = {'M', 'S'};

    while (!stop_.load()) {
        sockaddr_in client_addr{};
        socklen_t client_len = sizeof(client_addr);
        int conn = ::accept(listen_fd_, reinterpret_cast<sockaddr *>(&client_addr), &client_len);
        if (conn < 0) {
            if (stop_.load()) break;
            if (errno == EINTR) continue;
            std::fprintf(stderr, "ZealSync: accept() failed: %s\n", strerror(errno));
            continue;
        }

        timeval tv{};
        tv.tv_sec = 5;
        ::setsockopt(conn, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv));
        ::setsockopt(conn, SOL_SOCKET, SO_SNDTIMEO, &tv, sizeof(tv));

        std::string body;
        FrameStatus status = read_frame(conn, kClientMagic, body);
        if (status != FrameStatus::ok) {
            ::close(conn);
            continue;
        }

        // Either the dispatcher returns Completed (sync — we own the fd, write
        // and close), or Deferred (handler has taken ownership of the fd, will
        // write the final frame from the main thread, and is responsible for
        // closing it). The variant forces explicit branching here.
        DispatchResult result;
        try {
            auto request = nlohmann::json::parse(body);
            result = dispatcher_.dispatch(request, conn);
        } catch (const nlohmann::json::parse_error &e) {
            result = DispatchCompleted{
                make_error("invalidRequest", std::string("JSON parse error: ") + e.what())};
        } catch (const std::exception &e) {
            result = DispatchCompleted{make_error("internalError", e.what())};
        }

        if (auto *completed = std::get_if<DispatchCompleted>(&result)) {
            write_frame(conn, kServerMagic, completed->body.dump());
            ::close(conn);
        }
        // Deferred: handler owns conn. Do not close.
    }
}

}
