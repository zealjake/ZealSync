cmake_minimum_required(VERSION 3.20)
project(reaper_zealsync CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

option(ZEALSYNC_STANDALONE "Build a standalone test executable (no REAPER required)" OFF)

# Net-layer sources are REAPER-free: framing, dispatcher, listener, queue,
# uuid. These can be linked into either the dylib or the standalone exe.
set(NET_SOURCES
    src/net/framing.cpp
    src/net/dispatcher.cpp
    src/net/listener.cpp
    src/net/main_thread_queue.cpp
    src/net/protocol.cpp
    src/net/udp_discovery.cpp
    src/net/uuid.cpp
)

# REAPER-bound sources call into the REAPER C API and only link inside the
# dylib (where REAPERAPI_LoadAPI populates the function pointers at load
# time). Standalone leaves these out — there are no REAPER symbols to bind.
set(REAPER_SOURCES
    src/reaper_api/project.cpp
    src/sync/info.cpp
    src/sync/markers.cpp
)

# REAPER-free sub-units of REAPER-bound handlers. These contain pure logic
# (JSON shape, sort/dedup) split from their handler so unit tests can link
# them without the REAPER API.
set(REAPER_FREE_HANDLER_SOURCES
    src/sync/markers_response.cpp
)

if(ZEALSYNC_STANDALONE)
    add_executable(reaper_zealsync src/main.cpp ${NET_SOURCES})
    target_compile_definitions(reaper_zealsync PRIVATE ZEALSYNC_STANDALONE=1)
else()
    add_library(reaper_zealsync MODULE
        src/main.cpp ${NET_SOURCES} ${REAPER_SOURCES} ${REAPER_FREE_HANDLER_SOURCES})
    set_target_properties(reaper_zealsync PROPERTIES
        PREFIX ""
        SUFFIX ".dylib"
    )

    # Auto-install to REAPER's UserPlugins directory after every build.
    # Disable with -DZEALSYNC_AUTO_INSTALL=OFF.
    option(ZEALSYNC_AUTO_INSTALL "Copy the built dylib into REAPER's UserPlugins dir after linking" ON)
    if(ZEALSYNC_AUTO_INSTALL AND APPLE)
        set(ZEALSYNC_USERPLUGINS_DIR
            "$ENV{HOME}/Library/Application Support/REAPER/UserPlugins"
            CACHE PATH "REAPER UserPlugins directory")
        add_custom_command(TARGET reaper_zealsync POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E make_directory "${ZEALSYNC_USERPLUGINS_DIR}"
            COMMAND ${CMAKE_COMMAND} -E copy_if_different
                    "$<TARGET_FILE:reaper_zealsync>"
                    "${ZEALSYNC_USERPLUGINS_DIR}/reaper_zealsync.dylib"
            COMMENT "Installing reaper_zealsync.dylib -> ${ZEALSYNC_USERPLUGINS_DIR}"
            VERBATIM)
    endif()
endif()

target_include_directories(reaper_zealsync PRIVATE
    third_party
)
# SYSTEM include for vendored SDK headers — silences -Wunused-parameter and friends
# in upstream code we don't own.
target_include_directories(reaper_zealsync SYSTEM PRIVATE
    third_party/reaper-sdk/sdk
)

target_compile_options(reaper_zealsync PRIVATE -Wall -Wextra -Wpedantic)

find_package(Threads REQUIRED)
target_link_libraries(reaper_zealsync PRIVATE Threads::Threads)

# Tests — small standalone executables, one per logical unit. Built by default;
# disable with -DZEALSYNC_BUILD_TESTS=OFF.
option(ZEALSYNC_BUILD_TESTS "Build standalone unit-test executables" ON)
if(ZEALSYNC_BUILD_TESTS)
    add_executable(queue_test
        tests/queue_test.cpp
        src/net/main_thread_queue.cpp
    )
    target_include_directories(queue_test PRIVATE src)
    target_compile_options(queue_test PRIVATE -Wall -Wextra -Wpedantic)
    target_link_libraries(queue_test PRIVATE Threads::Threads)

    add_executable(uuid_test
        tests/uuid_test.cpp
        src/net/uuid.cpp
    )
    target_include_directories(uuid_test PRIVATE src)
    target_compile_options(uuid_test PRIVATE -Wall -Wextra -Wpedantic)

    add_executable(udp_discovery_test
        tests/udp_discovery_test.cpp
        src/net/udp_discovery.cpp
        src/net/protocol.cpp
    )
    target_include_directories(udp_discovery_test PRIVATE src third_party)
    target_compile_options(udp_discovery_test PRIVATE -Wall -Wextra -Wpedantic)
    target_link_libraries(udp_discovery_test PRIVATE Threads::Threads)

    add_executable(markers_test
        tests/markers_test.cpp
        ${REAPER_FREE_HANDLER_SOURCES}
    )
    target_include_directories(markers_test PRIVATE src third_party)
    target_compile_options(markers_test PRIVATE -Wall -Wextra -Wpedantic)
endif()
