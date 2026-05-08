#include "dispatcher.h"

#include "../version.h"

namespace zealsync::net {

namespace {

bool protocol_versions_compatible(const std::string &client) {
    auto first_dot = client.find('.');
    if (first_dot == std::string::npos) return false;
    auto second_dot = client.find('.', first_dot + 1);
    std::string client_major_minor = client.substr(
        0, second_dot == std::string::npos ? client.size() : second_dot);

    std::string ours = kProtocolVersion;
    auto our_dot = ours.find('.');
    auto our_dot2 = ours.find('.', our_dot + 1);
    std::string our_major_minor = ours.substr(
        0, our_dot2 == std::string::npos ? ours.size() : our_dot2);

    return client_major_minor == our_major_minor;
}

DispatchResult completed(nlohmann::json body) {
    return DispatchCompleted{std::move(body)};
}

}

nlohmann::json make_error(const std::string &code, const std::string &message) {
    return nlohmann::json{
        {"status", "error"},
        {"code", code},
        {"message", message},
    };
}

void Dispatcher::register_verb(const std::string &name, Handler handler) {
    handlers_[name] = std::move(handler);
}

DispatchResult Dispatcher::dispatch(const nlohmann::json &request, int fd) const {
    if (!request.is_object() || !request.contains("action") || !request["action"].is_string()) {
        return completed(make_error("invalidRequest", "Missing or non-string 'action' field."));
    }
    if (!request.contains("protocolVersion") || !request["protocolVersion"].is_string()) {
        return completed(make_error("invalidRequest", "Missing or non-string 'protocolVersion' field."));
    }

    const auto client_version = request["protocolVersion"].get<std::string>();
    if (!protocol_versions_compatible(client_version)) {
        return completed(make_error(
            "protocolVersionMismatch",
            "Client protocol version " + client_version +
                " is incompatible with server " + kProtocolVersion + "."));
    }

    const auto action = request["action"].get<std::string>();
    auto it = handlers_.find(action);
    if (it == handlers_.end()) {
        return completed(make_error("unknownAction", "Unknown action: " + action));
    }

    try {
        return it->second(request, fd);
    } catch (const std::exception &e) {
        // Sync-path exception. If the handler had already deferred, it
        // owns the fd and any failure is its problem (the closure body
        // catches its own exceptions). This catch only protects the
        // pre-defer portion of the handler.
        return completed(make_error("internalError", e.what()));
    }
}

}
