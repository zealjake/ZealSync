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
endif()

target_include_directories(reaper_zealsync PRIVATE
    third_party
    third_party/reaper-sdk/sdk
    include
)

target_compile_options(reaper_zealsync PRIVATE -Wall -Wextra -Wpedantic)

find_package(Threads REQUIRED)
target_link_libraries(reaper_zealsync PRIVATE Threads::Threads)
