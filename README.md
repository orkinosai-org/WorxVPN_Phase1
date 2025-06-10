# vpniosdemo

Fork of Apple SimpleTunnel VPN sample, set up for SoftEther integration demo (Phase 1).

- Static library is in /lib
- Wrapper files are in PacketTunnel
- See PacketTunnelProvider.swift for integration TODOs

## How to continue
- Open in Xcode (on Mac)
- Add lib/libsoftethervpn.a to the PacketTunnel target
- Add the wrapper files to the PacketTunnel target
- Wire up connect logic in PacketTunnelProvider.swift
