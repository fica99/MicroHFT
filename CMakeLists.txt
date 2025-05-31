cmake_minimum_required(VERSION 3.14 FATAL_ERROR)

# create project
project(microhft)

# add executable
add_executable(microhft main.cpp)

# add dependencies
include(cmake/CPM.cmake)

# Force spdlog to build as a shared (dynamic) library
set(SPDLOG_BUILD_SHARED ON CACHE BOOL "Build spdlog as a shared library" FORCE)

CPMAddPackage("gh:gabime/spdlog@1.8.2")

# link dependencies
target_link_libraries(microhft PRIVATE spdlog::spdlog)
