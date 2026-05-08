#ifndef ZEALSYNC_VERSION_H
#define ZEALSYNC_VERSION_H

// Single source of truth for both version axes the C++ extension reports.
// Bumping rules in docs/WIRE_PROTOCOL.md §10.

namespace zealsync {

// Wire-protocol version. Both halves must agree on MAJOR.MINOR (§10.3).
// The dispatcher gates on this; clients with a different MAJOR.MINOR get
// `protocolVersionMismatch`.
constexpr const char *kProtocolVersion = "1.0";

// Reaper-extension build version. Informational only — surfaced in the MA3
// Setup dialog for support diagnostics. The MA3 plugin reports its own build
// version separately (§7.1.2, §10.4).
constexpr const char *kBuildVersion = "0.1.0";

}

#endif
