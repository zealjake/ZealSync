#include "info_handler.h"

namespace zealsync::sync {

void register_info_handler(net::Dispatcher &dispatcher) {
    dispatcher.register_verb("info", [](const nlohmann::json &) {
        return nlohmann::json{
            {"status", "done"},
            {"protocolVersion", "1.0"},
            {"buildVersion", "0.1.0"},
            {"projectName", "ZealSync_M1_Stub"},
            {"projectGUID", "00000000000000000000000000000001"},
            {"projectPath", "/dev/null"},
            {"projectLength", 0.0},
            {"timeOffset", 0.0},
            {"frameRate", 25.0},
            {"dropFrame", false},
            {"savedMeta", nullptr},
        };
    });
}

}
