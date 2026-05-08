#ifndef ZEALSYNC_NET_FRAMING_H
#define ZEALSYNC_NET_FRAMING_H

#include <cstdint>
#include <string>

namespace zealsync::net {

constexpr std::uint32_t kMaxFrameLength = 16u * 1024u * 1024u;

enum class FrameStatus {
    ok,
    bad_magic,
    too_long,
    io_error,
    closed,
};

FrameStatus read_frame(int fd, const char expected_magic[2], std::string &body_out);
FrameStatus write_frame(int fd, const char magic[2], const std::string &body);

}

#endif
