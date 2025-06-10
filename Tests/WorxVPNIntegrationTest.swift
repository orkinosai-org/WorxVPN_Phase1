import XCTest
@testable import WorxVPN

final class WorxVPNIntegrationTest: XCTestCase {

    func testCustomerConnectionAndAuthentication() {
        // --- Customer-provided values ---
        let serverAddress = "customer.cluster.server.com"
        let primaryPort = 443
        let fallbackPort = 992
        let username = "customerUsername"
        let password = "customerPassword"

        let vpn = WorxVPN()

        // Try primary port first
        var connected = vpn.connectToClusterServer(address: serverAddress, port: primaryPort)
        if !connected {
            // Try fallback port if primary fails
            connected = vpn.connectToClusterServer(address: serverAddress, port: fallbackPort)
        }
        XCTAssertTrue(connected, "VPN should connect to the cluster server on either port.")

        let authenticated = vpn.authenticate(username: username, password: password)
        XCTAssertTrue(authenticated, "VPN should authenticate successfully with provided credentials.")
    }
}