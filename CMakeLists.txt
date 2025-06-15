cmake_minimum_required(VERSION 3.10)
project(SoftEtherVPNClientLib VERSION 1.0 LANGUAGES C)
set(CMAKE_C_STANDARD 11)

# Set minimum iOS version if building for iOS
if(CMAKE_SYSTEM_NAME STREQUAL "iOS")
    set(CMAKE_OSX_DEPLOYMENT_TARGET "12.0" CACHE STRING "Minimum iOS deployment version" FORCE)
endif()

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

file(GLOB_RECURSE SOURCES
    Core/*.c
    Protocol/*.c
    Session/*.c
    Crypto/*.c
    Mayaqua/*.c
)

foreach(PATTERN
    ".*WinUi\\.c$"
    ".*Wpc\\.c$"
    ".*Win32\\.c$"
    ".*WebUI\\.c$"
    ".*CedarPlugin\\.c$"
    ".*_Win.*\\.c$"
    ".*_Vista.*\\.c$"
    ".*VLanWin32\\.c$"
    ".*VLanUnix\\.c$"
    ".*VLan\\.c$"
    ".*VG\\.c$"
    ".*UT\\.c$"
    ".*UdpAccel\\.c$"
    ".*WaterMark\\.c$"
    ".*Virtual\\.c$"
    ".*Unix\\.c$"
    ".*Tracking\\.c$"
    ".*Tick64\\.c$"
    ".*TcpIp\\.c$"
    ".*Table\\.c$"
    ".*Session\\.c$"
    ".*Server\\.c$"
    ".*SecureNAT\\.c$"
    ".*SecureInfo\\.c$"
    ".*Secure\\.c$"
    ".*SeLowUser\\.c$"
    ".*Sam\\.c$"
    ".*SW\\.c$"
    ".*SM\\.c$"
    ".*Remote\\.c$"
    ".*Radius\\.c$"
    ".*Database\\.c$"
    ".*EM\\.c$"
    ".*DDNS\\.c$"
    ".*Protocol\\.c$"
    ".*Str\\.c$"
    ".*Pack\\.c$"
    ".*Object\\.c$"
    ".*OS\\.c$"
    ".*Network\\.c$"
    ".*NullLan\\.c$"
    ".*NativeStack\\.c$"
    ".*Microsoft\\.c$"
    ".*Memory\\.c$"
    ".*Mayaqua\\.c$"
    ".*Nat\\.c$"
    ".*NM\\.c$"
    ".*Logging\\.c$"
    ".*Listener\\.c$"
    ".*Link\\.c$"
    ".*Layer3\\.c$"
    ".*Interop_SSTP\\.c$"
    ".*Interop_OpenVPN\\.c$"
    ".*Kernel\\.c$"
    ".*Internat\\.c$"
    ".*IPsec_PPP\\.c$"
    ".*IPsec_L2TP\\.c$"
    ".*IPsec_IkePacket\\.c$"
    ".*IPsec_IPC\\.c$"
    ".*IPsec_IKE\\.c$"
    ".*IPsec_EtherIP\\.c$"
    ".*IPsec\\.c$"
    ".*Hub\\.c$"
    ".*EtherLog\\.c$"
    ".*FileIO\\.c$"
    ".*Encrypt\\.c$"
    ".*Console\\.c$"
    ".*Connection\\.c$"
    ".*Connect\\.c$"
    ".*Command\\.c$"
    ".*Client\\.c$"
    ".*Cfg\\.c$"
    ".*CedarPch\\.c$"
    ".*Cedar\\.c$"
    ".*CM\\.c$"
    ".*Bridge\\.c$"
    ".*Account\\.c$"
    ".*Admin\\.c$"
)
    list(FILTER SOURCES EXCLUDE REGEX "${PATTERN}")
endforeach()

add_library(softethervpn STATIC ${SOURCES})

target_include_directories(softethervpn PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_definitions(softethervpn PRIVATE OS_UNIX UNIX_BSD CPU_64)

set_target_properties(softethervpn PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/Release-iphoneos
    OUTPUT_NAME "softethervpn"
)