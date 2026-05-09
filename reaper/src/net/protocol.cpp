#include "protocol.h"

#include "../version.h"

namespace zealsync::net {

namespace {

std::string major_minor(const std::string &v) {
    auto first_dot = v.find('.');
    if (first_dot == std::string::npos) return v;
    auto second_dot = v.find('.', first_dot + 1);
    return v.substr(0, second_dot == std::string::npos ? v.size() : second_dot);
}

}

bool is_compatible_protocol_version(const std::string &client_version) {
    if (client_version.find('.') == std::string::npos) return false;
    return major_minor(client_version) == major_minor(kProtocolVersion);
}

}
