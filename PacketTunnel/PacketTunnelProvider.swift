import NetworkExtension

class PacketTunnelProvider: NEPacketTunnelProvider {
    override func startTunnel(options: [String : NSObject]?, completionHandler: @escaping (Error?) -> Void) {
        // Hardcoded Phase 1 demo credentials
        let host = "worxvpn.662.cloud"
        let port: UInt16 = 443
        let hub = "VPN"
        let username = "indteam"
        let password = "IND312team!Admin"

        // Call the Objective-C wrapper (works on Mac/Xcode)
        let result = SoftEtherVPNWrapper.connectToServer(host, port: port, hub: hub, username: username, password: password)
        if result {
            completionHandler(nil)
        } else {
            completionHandler(NSError(domain: "SoftEtherDemo", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to connect"]))
        }
    }

    override func stopTunnel(with reason: NEProviderStopReason, completionHandler: @escaping () -> Void) {
        SoftEtherVPNWrapper.disconnect()
        completionHandler()
    }
}