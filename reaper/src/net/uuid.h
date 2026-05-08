#ifndef ZEALSYNC_NET_UUID_H
#define ZEALSYNC_NET_UUID_H

#include <string>

namespace zealsync::net {

// 32-char lowercase hex UUIDv4, no braces, no dashes.
// Format per WIRE_PROTOCOL §7.1.1 (projectGUID): bare hex, position 12 is
// '4' (version), position 16 is one of 8/9/a/b (RFC 4122 variant).
//
// Uniqueness, not unpredictability. mt19937_64 seeded from std::random_device
// is sufficient — UUIDs need to collide-resist within a project corpus, not
// resist an attacker.
std::string uuid_v4_hex();

}

#endif
