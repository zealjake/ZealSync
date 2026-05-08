#ifndef ZEALSYNC_NET_PROTOCOL_H
#define ZEALSYNC_NET_PROTOCOL_H

// Wire-protocol helpers shared by the TCP dispatcher and the UDP discovery
// server. Anything that asks "is this client speaking my version of the wire
// protocol?" lives here.

#include <string>

namespace zealsync::net {

// Per WIRE_PROTOCOL §10.3: equal MAJOR.MINOR is compatible; PATCH differences
// tolerated. MAJOR or MINOR mismatches fail closed. Compares against
// kProtocolVersion (version.h).
bool is_compatible_protocol_version(const std::string &client_version);

}

#endif
