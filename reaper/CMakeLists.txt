cmake_minimum_required(VERSION 3.20)
project(reaper_zealsync CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

option(ZEALSYNC_STANDALONE "Build a standalone test executable (no REAPER required)" OFF)

set(SOURCES
    src/main.cpp
    src/net/framing.cpp
    src/net/dispatcher.cpp
    src/net/listener.cpp
    src/sync/info_handler.cpp
)

if(ZEALSYNC_STANDALONE)
    add_executable(reaper_zealsync ${SOURCES})
    target_compile_definitions(reaper_zealsync PRIVATE ZEALSYNC_STANDALONE=1)
else()
    add_library(reaper_zealsync MODULE ${SOURCES})
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
