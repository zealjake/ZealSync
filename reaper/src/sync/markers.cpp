#include "markers.h"

#include <unistd.h>

#include <cstdio>
#include <exception>

#include "../net/framing.h"
#include "../net/main_thread_queue.h"
#include "../reaper_api/project.h"

namespace zealsync::sync {

namespace {

constexpr char kServerMagic[2] = {'M', 'S'};

void write_and_close(int fd, const nlohmann::json &body) {
    net::write_frame(fd, kServerMagic, body.dump());
    ::close(fd);
}

void run_markers_on_main_thread(int fd) {
    try {
        if (!reaper_api::enum_projects()) {
            write_and_close(fd, net::make_error(
                                    "noProject",
                                    "No Reaper project is open."));
            return;
        }

        const auto raw = reaper_api::enum_markers();
        std::vector<markers_internal::InputMarker> input;
        input.reserve(raw.size());
        for (const auto &m : raw) {
            const auto ts = reaper_api::time_sig_at_time(m.startTime);
            input.push_back({
                m.isRegion,
                m.startTime,
                m.endTime,
                m.name,
                m.customColor,
                m.displayedColor,
                m.userNumber,
                m.guid,
                ts.bpm,
            });
        }
        write_and_close(fd, markers_internal::build_response(input));
    } catch (const std::exception &e) {
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

void register_markers_handler(net::Dispatcher &dispatcher) {
    dispatcher.register_verb("markers", [](const nlohmann::json &request, int fd) -> net::DispatchResult {
        if (!request.contains("dataPool") || !request["dataPool"].is_number_integer()) {
            return net::DispatchCompleted{
                net::make_error("invalidRequest",
                                "markers: missing or non-integer 'dataPool'.")};
        }

        const std::string wait_body = nlohmann::json{{"status", "wait"}}.dump();
        if (net::write_frame(fd, kServerMagic, wait_body) != net::FrameStatus::ok) {
            return net::DispatchCompleted{
                net::make_error("internalError", "markers: failed to send wait frame.")};
        }

        net::run_on_main_thread([fd]() { run_markers_on_main_thread(fd); });
        return net::DispatchDeferred{};
    });
}

}
