#ifndef ZEALSYNC_SYNC_MARKERS_H
#define ZEALSYNC_SYNC_MARKERS_H

#include <string>
#include <vector>

#include <nlohmann/json.hpp>

#include "../net/dispatcher.h"

namespace zealsync::sync {

void register_markers_handler(net::Dispatcher &dispatcher);

// Build the §7.2 response body from a vector of marker entries. Factored out
// for unit testing without going through the dispatcher / fd plumbing.
namespace markers_internal {

struct InputMarker {
    bool isRegion;
    double startTime;
    double endTime;        // ignored when isRegion is false
    std::string name;
    int customColorRaw;    // raw I_CUSTOMCOLOR (high bit set if custom)
    int displayedColorRaw; // raw I_DISPLAYEDCOLOR
    int userNumber;
    std::string guid;      // already-normalised 32-char lowercase hex
    double bpmAtPosition;
};

nlohmann::json build_response(const std::vector<InputMarker> &input);

}

}

#endif
