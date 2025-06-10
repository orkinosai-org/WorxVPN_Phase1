cmake_minimum_required(VERSION 3.10)
project(SoftEtherVPNClientLib VERSION 1.0 LANGUAGES C)
set(CMAKE_C_STANDARD 11)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

file(GLOB_RECURSE SOURCES
    Core/*.c Protocol/*.c Session/*.c Crypto/*.c Mayaqua/*.c
)
file(GLOB_RECURSE HEADERS
    Core/*.h Protocol/*.h Session/*.h Crypto/*.h Mayaqua/*.h
)

add_library(softethervpn STATIC ${SOURCES} ${HEADERS})

target_include_directories(softethervpn PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_definitions(softethervpn PRIVATE OS_UNIX UNIX_BSD CPU_64)
