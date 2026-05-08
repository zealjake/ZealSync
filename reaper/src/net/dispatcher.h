#ifndef ZEALSYNC_NET_DISPATCHER_H
#define ZEALSYNC_NET_DISPATCHER_H

#include <functional>
#include <string>
#include <unordered_map>

#include <nlohmann/json.hpp>

namespace zealsync::net {

constexpr const char *kProtocolVersion = "1.0";

using Handler = std::function<nlohmann::json(const nlohmann::json &)>;

class Dispatcher {
public:
    void register_verb(const std::string &name, Handler handler);
    nlohmann::json dispatch(const nlohmann::json &request) const;

private:
    std::unordered_map<std::string, Handler> handlers_;
};

nlohmann::json make_error(const std::string &code, const std::string &message);

}

#endif
