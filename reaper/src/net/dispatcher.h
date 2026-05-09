#ifndef ZEALSYNC_NET_DISPATCHER_H
#define ZEALSYNC_NET_DISPATCHER_H

#include <functional>
#include <string>
#include <unordered_map>
#include <variant>

#include <nlohmann/json.hpp>

namespace zealsync::net {

// Result of dispatching a request. Either:
// - Completed: we have the response body to write back synchronously.
// - Deferred: the handler has taken ownership of the connection fd. It has
//   already written {"status":"wait"} (per WIRE_PROTOCOL §5), enqueued a
//   main-thread closure that will write the final done/error frame, and
//   closed the fd itself. The listener MUST NOT close the fd in this case.
//
// Modelled as a std::variant so the listener can't accidentally treat a
// deferred result as if it had a body — the type system forces the branching.
struct DispatchCompleted {
    nlohmann::json body;
};
struct DispatchDeferred {};
using DispatchResult = std::variant<DispatchCompleted, DispatchDeferred>;

// Handlers receive the parsed request and the connection fd. Sync handlers
// ignore the fd and return DispatchCompleted{...}. Async handlers send a
// `wait` frame on the fd, enqueue main-thread work, and return
// DispatchDeferred{}.
using Handler = std::function<DispatchResult(const nlohmann::json &request, int fd)>;

class Dispatcher {
public:
    void register_verb(const std::string &name, Handler handler);
    DispatchResult dispatch(const nlohmann::json &request, int fd) const;

private:
    std::unordered_map<std::string, Handler> handlers_;
};

nlohmann::json make_error(const std::string &code, const std::string &message);

}

#endif
