import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var connectButton: UIButton!

    // Demo credentials (replace with your actual test values)
    let vpnServer = "demo.vpnserver.com"
    let vpnPort = 443
    let vpnHub = "DEMOHUB"
    let vpnUsername = "demouser"
    let vpnPassword = "demopass"

    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = "Ready to connect"
        statusLabel.textAlignment = .center
        connectButton.setTitle("Connect", for: .normal)
    }

    // MARK: - IBActions
    @IBAction func connectTapped(_ sender: UIButton) {
        statusLabel.text = "Connecting..."
        print("Connect button tapped! Calling VPN wrapper...")

        let result = SoftEtherVPNWrapper.connectToServer(
            vpnServer,
            port: vpnPort,
            hub: vpnHub,
            username: vpnUsername,
            password: vpnPassword
        )

        if result {
            statusLabel.text = "Connected!"
        } else {
            statusLabel.text = "Failed."
        }
    }
}