cmake_minimum_required(VERSION 3.10)
project(SoftEtherVPNClientLib VERSION 1.0 LANGUAGES C)
set(CMAKE_C_STANDARD 11)

# Set minimum iOS version if building for iOS
if(CMAKE_SYSTEM_NAME STREQUAL "iOS")
    set(CMAKE_OSX_DEPLOYMENT_TARGET "12.0" CACHE STRING "Minimum iOS deployment version" FORCE)
endif()

# Make sure CMake will find your stubs
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

file(GLOB_RECURSE SOURCES
    Core/*.c
    Protocol/*.c
    Session/*.c
    Crypto/*.c
    Mayaqua/*.c
)

# Only exclude obvious Windows/platform-specific files
foreach(PATTERN
    ".*WinUi\\.c$"
    ".*Wpc\\.c$"
    ".*Win32\\.c$"
    ".*WebUI\\.c$"
    ".*CedarPlugin\\.c$"
    ".*_Win.*\\.c$"
    ".*_Vista.*\\.c$"
    ".*VLanWin32\\.c$"
)
    list(FILTER SOURCES EXCLUDE REGEX "${PATTERN}")
endforeach()

add_library(softethervpn STATIC ${SOURCES})

target_include_directories(softethervpn PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

target_compile_definitions(softethervpn PRIVATE OS_UNIX UNIX_BSD CPU_64)

set_target_properties(softethervpn PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/Release-iphoneos
    OUTPUT_NAME "softethervpn"
)