import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var connectButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = "Ready to connect"
        statusLabel.textAlignment = .center
        connectButton.setTitle("Connect", for: .normal)
    }

    // MARK: - IBActions
    @IBAction func connectTapped(_ sender: UIButton) {
        statusLabel.text = "Connecting..."
        print("Connect button tapped! Call your VPN wrapper function here.")
        // Example:
        // let result = YourVPNWrapper.connect()
        // statusLabel.text = result ? "Connected!" : "Failed."
    }
}
