# vpniosdemo

**Phase 1 SoftEther VPN iOS Demo**

This project integrates the SoftEther client static lib (`lib/libsoftethervpn.a`) and Objective-C wrapper (`SoftEtherVPNWrapper.h`/`.m` in the project root) with Apple's SimpleTunnel sample.  
The goal: provide a working iOS Network Extension (PacketTunnel) that connects using SoftEther, with demo credentials hardcoded for Phase 1.

---

## Setup & Build Instructions (for Mac/Xcode)

### 1. Prerequisites

- macOS with [Xcode](https://developer.apple.com/xcode/) installed.
- Developer account (for provisioning and signing the extension).

---

### 2. Clone the Repository

```bash
git clone https://github.com/orkinosai/vpniosdemo.git
cd vpniosdemo
```

---

### 3. Open the Project in Xcode

- Open `vpniosdemo.xcodeproj` in Xcode.

---

### 4. Add the Static Library and Wrapper Files

#### a. Add the Static Library

1. In Xcode's Project Navigator, right-click the **PacketTunnel** target (under "Targets").
2. Choose **Add Files to "vpniosdemo"...**
3. Select `lib/libsoftethervpn.a` and add it **to the PacketTunnel target**.

#### b. Add the Wrapper Files

1. In the Project Navigator, drag `SoftEtherVPNWrapper.h` and `SoftEtherVPNWrapper.m` (from the repo root) into Xcode.
2. When prompted, add them **to the PacketTunnel target**.

---

### 5. Set Up Bridging Header

1. Make sure `PacketTunnel/PacketTunnel-Bridging-Header.h` exists and contains:
    ```objc
    #import "../SoftEtherVPNWrapper.h"
    ```
2. In Xcode, select the **PacketTunnel** target.
3. Go to **Build Settings** > search for "Objective-C Bridging Header".
4. Set it to: `PacketTunnel/PacketTunnel-Bridging-Header.h`

---

### 6. Configure Code Signing

- Configure **Signing & Capabilities** for the PacketTunnel target with your development team and a valid provisioning profile.

---

### 7. Build & Run

- Select a simulator or (preferably) a real iOS device.
- Build and run the app.
- Activate the VPN extension (from the app or iOS Settings, as configured).

---

### 8. Demo Logic

- The initial VPN connection logic is in `PacketTunnel/PacketTunnelProvider.swift`, using hardcoded demo credentials.
- Successful connection means your static lib and wrapper are correctly wired!

---

## Notes

- For Phase 1, credentials and host are hardcoded.  
- Next phases can add UI for dynamic config, error handling, etc.

---

### Troubleshooting

- If you see "symbols not found" for SoftEther functions, check that `libsoftethervpn.a` is linked to the **PacketTunnel** target.
- Double-check the bridging header path and imports.
- Ensure code signing is correctly set up for both the app and extension targets.

---

## Contact

For issues or setup help, contact [@orkinosai](https://github.com/orkinosai).