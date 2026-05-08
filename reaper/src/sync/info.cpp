#include "info.h"

#include <unistd.h>

#include <cstdio>
#include <exception>

#include <nlohmann/json.hpp>

#include "../net/framing.h"
#include "../net/main_thread_queue.h"
#include "../net/uuid.h"
#include "../reaper_api/project.h"
#include "../version.h"

namespace zealsync::sync {

namespace {

constexpr char kServerMagic[2] = {'M', 'S'};
constexpr const char *kExtNamespace = "ZealSync";
constexpr const char *kExtKeyProjectGUID = "projectGUID";

void write_and_close(int fd, const nlohmann::json &body) {
    net::write_frame(fd, kServerMagic, body.dump());
    ::close(fd);
}

// Read or generate the project's persistent GUID per WIRE_PROTOCOL §7.1.1.
// Always returns the canonical 32-char lowercase hex form.
std::string read_or_generate_project_guid() {
    auto existing = reaper_api::get_proj_ext_state(kExtNamespace, kExtKeyProjectGUID);
    if (existing && existing->size() == 32) {
        return *existing;
    }
    const std::string fresh = net::uuid_v4_hex();
    reaper_api::set_proj_ext_state(kExtNamespace, kExtKeyProjectGUID, fresh.c_str());
    // Operator must save the project for the GUID to land on disk. We do not
    // auto-save (§7.1.1). The dirty marker is enough operator signal.
    reaper_api::mark_project_dirty();
    return fresh;
}

void run_info_on_main_thread(int fd) {
    try {
        if (!reaper_api::enum_projects()) {
            write_and_close(fd, net::make_error(
                                    "noProject",
                                    "No Reaper project is open."));
            return;
        }

        const auto guid = read_or_generate_project_guid();
        const auto [fps, drop] = reaper_api::get_frame_rate_and_dropframe();

        nlohmann::json response = {
            {"status", "done"},
            {"protocolVersion", kProtocolVersion},
            {"buildVersion", kBuildVersion},
            {"projectName", reaper_api::get_project_name()},
            {"projectGUID", guid},
            {"projectPath", reaper_api::get_project_path()},
            {"projectLength", reaper_api::get_project_length()},
            {"timeOffset", reaper_api::get_time_offset()},
            {"frameRate", fps},
            {"dropFrame", drop},
            // savedMeta is always null until M6 ships saveMeta (§7.1.3).
            {"savedMeta", nullptr},
        };
        write_and_close(fd, response);
    } catch (const std::exception &e) {
        // Any throw inside the closure must be caught — letting it propagate
        // crashes REAPER through the timer drain path.
        try {
            write_and_close(fd, net::make_error("internalError", e.what()));
        } catch (...) {
            ::close(fd);
        }
    } catch (...) {
        ::close(fd);
    }
}

}

void register_info_handler(net::Dispatcher &dispatcher) {
    dispatcher.register_verb("info", [](const nlohmann::json &request, int fd) -> net::DispatchResult {
        // Verb-specific validation of dataPool runs synchronously — no
        // point deferring to the main thread just to reject a malformed
        // request.
        if (!request.contains("dataPool") || !request["dataPool"].is_number_integer()) {
            return net::DispatchCompleted{
                net::make_error("invalidRequest",
                                "info: missing or non-integer 'dataPool'.")};
        }

        // Send the wait continuation immediately. Any failure here means the
        // client is gone — fall back to a sync error so the listener closes
        // the fd.
        const std::string wait_body = nlohmann::json{{"status", "wait"}}.dump();
        if (net::write_frame(fd, kServerMagic, wait_body) != net::FrameStatus::ok) {
            return net::DispatchCompleted{
                net::make_error("internalError", "info: failed to send wait frame.")};
        }

        // Hand fd ownership to the main-thread closure. Listener must NOT
        // close after this point — DispatchDeferred is the signal.
        net::run_on_main_thread([fd]() { run_info_on_main_thread(fd); });
        return net::DispatchDeferred{};
    });
}

}
