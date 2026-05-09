#include "uuid.h"

#include <cstdint>
#include <cstdio>
#include <random>

namespace zealsync::net {

namespace {

std::mt19937_64 &thread_rng() {
    static thread_local std::mt19937_64 rng = [] {
        std::random_device rd;
        std::seed_seq seq{rd(), rd(), rd(), rd(), rd(), rd(), rd(), rd()};
        return std::mt19937_64(seq);
    }();
    return rng;
}

char hex_digit(int n) {
    return (n < 10) ? static_cast<char>('0' + n) : static_cast<char>('a' + n - 10);
}

int parse_hex_digit(char c) {
    if (c >= '0' && c <= '9') return c - '0';
    return c - 'a' + 10;
}

}

std::string uuid_v4_hex() {
    auto &rng = thread_rng();
    std::uint64_t hi = rng();
    std::uint64_t lo = rng();

    char buf[33];
    std::snprintf(buf, sizeof(buf), "%016llx%016llx",
                  static_cast<unsigned long long>(hi),
                  static_cast<unsigned long long>(lo));

    // Version 4: high nibble of byte 6 → hex char at position 12.
    buf[12] = '4';

    // Variant 10xx: top two bits of byte 8 → high nibble of hex char at
    // position 16. Force the nibble to one of 8, 9, a, b.
    int n = parse_hex_digit(buf[16]);
    n = (n & 0x3) | 0x8;
    buf[16] = hex_digit(n);

    return std::string(buf, 32);
}

}
