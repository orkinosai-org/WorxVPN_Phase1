import UIKit

class MainViewController: UIViewController {

    let textView = UITextView()
    let toggleSwitch = UISwitch()
    var useRealVPN = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        let label = UILabel()
        label.text = "Use Real VPN:"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)

        toggleSwitch.translatesAutoresizingMaskIntoConstraints = false
        toggleSwitch.addTarget(self, action: #selector(toggleChanged), for: .valueChanged)
        view.addSubview(toggleSwitch)

        let button = UIButton(type: .system)
        button.setTitle("Start VPN", for: .normal)
        button.addTarget(self, action: #selector(startVPN), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        textView.isEditable = false
        textView.font = .systemFont(ofSize: 14)
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            toggleSwitch.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            toggleSwitch.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }

    @objc func toggleChanged() {
        useRealVPN = toggleSwitch.isOn
    }

    @objc func startVPN() {
        textView.text = ""
        log("Starting VPN...")
        let success = SoftEtherVPNWrapper.connect(
            toServer: "worxvpn.662.cloud",
            port: 443,
            hub: "VPN",
            username: "indteam",
            password: "IND312team!Admin"
        )
        if success {
            log("✅ VPN Connected successfully to worxvpn.662.cloud ✓")
        } else {
            log("❌ VPN Connection FAILED.")
        }
    }

    func log(_ message: String) {
        textView.text += message + "\n"
    }
}