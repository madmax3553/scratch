cmake_minimum_required(VERSION 3.10)
project(uiapp C)

# Enable debug symbols
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -g")

find_package(raylib REQUIRED)
add_executable(uiapp main.c)
target_link_libraries(uiapp raylib m)