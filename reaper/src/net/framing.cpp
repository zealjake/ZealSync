#include "framing.h"

#include <cstring>
#include <unistd.h>
#include <sys/socket.h>
#include <errno.h>

namespace zealsync::net {

namespace {

bool read_exact(int fd, void *buf, std::size_t n, bool &closed) {
    auto *p = static_cast<char *>(buf);
    std::size_t got = 0;
    while (got < n) {
        ssize_t r = ::recv(fd, p + got, n - got, 0);
        if (r == 0) {
            closed = true;
            return false;
        }
        if (r < 0) {
            if (errno == EINTR) continue;
            return false;
        }
        got += static_cast<std::size_t>(r);
    }
    return true;
}

bool write_exact(int fd, const void *buf, std::size_t n) {
    const auto *p = static_cast<const char *>(buf);
    std::size_t sent = 0;
    while (sent < n) {
        ssize_t w = ::send(fd, p + sent, n - sent, 0);
        if (w < 0) {
            if (errno == EINTR) continue;
            return false;
        }
        sent += static_cast<std::size_t>(w);
    }
    return true;
}

}

FrameStatus read_frame(int fd, const char expected_magic[2], std::string &body_out) {
    char magic[2];
    bool closed = false;
    if (!read_exact(fd, magic, 2, closed)) {
        return closed ? FrameStatus::closed : FrameStatus::io_error;
    }
    if (magic[0] != expected_magic[0] || magic[1] != expected_magic[1]) {
        return FrameStatus::bad_magic;
    }

    unsigned char len_bytes[4];
    if (!read_exact(fd, len_bytes, 4, closed)) {
        return closed ? FrameStatus::closed : FrameStatus::io_error;
    }
    std::uint32_t length =
        static_cast<std::uint32_t>(len_bytes[0]) |
        (static_cast<std::uint32_t>(len_bytes[1]) << 8) |
        (static_cast<std::uint32_t>(len_bytes[2]) << 16) |
        (static_cast<std::uint32_t>(len_bytes[3]) << 24);

    if (length > kMaxFrameLength) {
        return FrameStatus::too_long;
    }

    body_out.resize(length);
    if (length > 0) {
        if (!read_exact(fd, body_out.data(), length, closed)) {
            return closed ? FrameStatus::closed : FrameStatus::io_error;
        }
    }
    return FrameStatus::ok;
}

FrameStatus write_frame(int fd, const char magic[2], const std::string &body) {
    if (body.size() > kMaxFrameLength) {
        return FrameStatus::too_long;
    }
    if (!write_exact(fd, magic, 2)) return FrameStatus::io_error;

    std::uint32_t length = static_cast<std::uint32_t>(body.size());
    unsigned char len_bytes[4] = {
        static_cast<unsigned char>(length & 0xff),
        static_cast<unsigned char>((length >> 8) & 0xff),
        static_cast<unsigned char>((length >> 16) & 0xff),
        static_cast<unsigned char>((length >> 24) & 0xff),
    };
    if (!write_exact(fd, len_bytes, 4)) return FrameStatus::io_error;
    if (!body.empty() && !write_exact(fd, body.data(), body.size())) {
        return FrameStatus::io_error;
    }
    return FrameStatus::ok;
}

}
