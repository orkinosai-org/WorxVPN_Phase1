cmake_minimum_required(VERSION 3.10)
project(SoftEtherVPNClientLib VERSION 1.0 LANGUAGES C)
set(CMAKE_C_STANDARD 11)

# Set minimum iOS version if building for iOS
if(CMAKE_SYSTEM_NAME STREQUAL "iOS")
    set(CMAKE_OSX_DEPLOYMENT_TARGET "12.0" CACHE STRING "Minimum iOS deployment version" FORCE)
endif()

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

# Gather all sources
file(GLOB_RECURSE SOURCES
    Core/*.c
    Protocol/*.c
    Session/*.c
    Crypto/*.c
    Mayaqua/*.c
)

# Exclude Windows-specific and UI files that cannot build on iOS/macOS
list(FILTER SOURCES EXCLUDE REGEX ".*/WinUi\\.c$")
list(FILTER SOURCES EXCLUDE REGEX ".*/Wpc\\.c$")
list(FILTER SOURCES EXCLUDE REGEX ".*/Win32\\.c$")
list(FILTER SOURCES EXCLUDE REGEX ".*/WebUI\\.c$")
list(FILTER SOURCES EXCLUDE REGEX ".*/CedarPlugin\\.c$")
# Exclude any file with _Win or _Vista in the name
list(FILTER SOURCES EXCLUDE REGEX ".*_Win.*\\.c$")
list(FILTER SOURCES EXCLUDE REGEX ".*_Vista.*\\.c$")

add_library(softethervpn STATIC ${SOURCES})

target_include_directories(softethervpn PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_definitions(softethervpn PRIVATE OS_UNIX UNIX_BSD CPU_64)

# Set output directory for the .a file to match your workflow
set_target_properties(softethervpn PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/Release-iphoneos
    OUTPUT_NAME "softethervpn"
)