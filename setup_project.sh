#!/bin/bash

echo "Creating WorxVPN_TestApp project structure..."

# 1. Create the main directories
mkdir -p WorxVPN_TestApp/WorxVPN_TestApp
mkdir -p WorxVPN_TestApp/lib/includes
mkdir -p WorxVPN_TestApp/.github/workflows

# 2. Create Swift Source Files

# AppDelegate.swift
cat <<EOF > WorxVPN_TestApp/WorxVPN_TestApp/AppDelegate.swift
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}
EOF

# ViewController.swift
cat <<EOF > WorxVPN_TestApp/WorxVPN_TestApp/ViewController.swift
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
EOF

# 3. Create the Bridging Header
cat <<EOF > WorxVPN_TestApp/WorxVPN_TestApp/WorxVPN_TestApp-Bridging-Header.h
//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//
#include "vpn.h"
EOF

# 4. Create the Storyboard (as XML)
cat <<EOF > WorxVPN_TestApp/WorxVPN_TestApp/Main.storyboard
<?xml version="1.0" encoding="UTF-8"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="3.0" toolsVersion="22155" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" useSafeAreas="YES" colorMatched="YES" initialViewController="BYZ-38-t0r">
    <device id="retina6_12" orientation="portrait" appearance="light"/>
    <dependencies>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="22131"/>
        <capability name="Safe area layout guides" minToolsVersion="9.0"/>
        <capability name="System colors in document resources" minToolsVersion="11.0"/>
        <capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>
    </dependencies>
    <scenes>
        <scene sceneID="tne-QT-ifu">
            <objects>
                <viewController id="BYZ-38-t0r" customClass="ViewController" customModule="WorxVPN_TestApp" customModuleProvider="target" sceneMemberID="viewController">
                    <view key="view" contentMode="scaleToFill" id="8bC-Xf-vdC">
                        <rect key="frame" x="0.0" y="0.0" width="393" height="852"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <subviews>
                            <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" text="Status Label" textAlignment="center" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="oB2-j3-ESb">
                                <rect key="frame" x="20" y="415.66666666666669" width="353" height="21"/>
                                <fontDescription key="fontDescription" type="system" pointSize="17"/>
                                <nil key="textColor"/>
                                <nil key="highlightedColor"/>
                            </label>
                            <button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="system" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="KjB-Wd-qJg">
                                <rect key="frame" x="159" y="456.66666666666669" width="75" height="35"/>
                                <state key="normal" title="Button"/>
                                <buttonConfiguration key="configuration" style="filled" title="Button"/>
                                <connections>
                                    <action selector="connectTapped:" destination="BYZ-38-t0r" eventType="touchUpInside" id="wzC-3E-1aE"/>
                                </connections>
                            </button>
                        </subviews>
                        <viewLayoutGuide key="safeArea" id="6Tk-OE-BBY"/>
                        <color key="backgroundColor" systemColor="systemBackgroundColor"/>
                        <constraints>
                            <constraint firstItem="KjB-Wd-qJg" firstAttribute="centerX" secondItem="8bC-Xf-vdC" secondAttribute="centerX" id="6jT-D2-qU5"/>
                            <constraint firstItem="oB2-j3-ESb" firstAttribute="leading" secondItem="6Tk-OE-BBY" secondAttribute="leading" constant="20" id="Uo9-vU-bHh"/>
                            <constraint firstItem="oB2-j3-ESb" firstAttribute="centerY" secondItem="8bC-Xf-vdC" secondAttribute="centerY" id="hN5-Tz-1bQ"/>
                            <constraint firstItem="6Tk-OE-BBY" firstAttribute="trailing" secondItem="oB2-j3-ESb" secondAttribute="trailing" constant="20" id="lF0-Pj-gK7"/>
                            <constraint firstItem="KjB-Wd-qJg" firstAttribute="top" secondItem="oB2-j3-ESb" secondAttribute="bottom" constant="20" id="nN8-0B-Kk7"/>
                        </constraints>
                    </view>
                    <connections>
                        <outlet property="connectButton" destination="KjB-Wd-qJg" id="cEa-j3-1x8"/>
                        <outlet property="statusLabel" destination="oB2-j3-ESb" id="mGz-b3-Xk3"/>
                    </connections>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="dkx-z0-nzr" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="138" y="4"/>
        </scene>
    </scenes>
    <resources>
        <systemColor name="systemBackgroundColor">
            <color white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
        </systemColor>
    </resources>
</document>
EOF

# 5. Create the Xcode Project File (This is the magic part)
mkdir -p WorxVPN_TestApp/WorxVPN_TestApp.xcodeproj
cat <<'EOF' > WorxVPN_TestApp/WorxVPN_TestApp.xcodeproj/project.pbxproj
// !$*UTF8*$!
{
	archiveVersion = 1;
	classes = {
	};
	objectVersion = 56;
	objects = {

/* Begin PBXBuildFile section */
		F424E6A42C12D4AA00768F3A /* AppDelegate.swift in Sources */ = {isa = PBXBuildFile; fileRef = F424E6A32C12D4AA00768F3A /* AppDelegate.swift */; };
		F424E6A62C12D4AA00768F3A /* ViewController.swift in Sources */ = {isa = PBXBuildFile; fileRef = F424E6A52C12D4AA00768F3A /* ViewController.swift */; };
		F424E6A92C12D4AB00768F3A /* Main.storyboard in Resources */ = {isa = PBXBuildFile; fileRef = F424E6A82C12D4AA00768F3A /* Main.storyboard */; };
		F424E6B42C12D53900768F3A /* libsoftethervpn.a in Frameworks */ = {isa = PBXBuildFile; fileRef = F424E6B32C12D53900768F3A /* libsoftethervpn.a */; };
/* End PBXBuildFile section */

/* Begin PBXFileReference section */
		F424E6A02C12D4A900768F3A /* WorxVPN_TestApp.app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = WorxVPN_TestApp.app; sourceTree = BUILT_PRODUCTS_DIR; };
		F424E6A32C12D4AA00768F3A /* AppDelegate.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AppDelegate.swift; sourceTree = "<group>"; };
		F424E6A52C12D4AA00768F3A /* ViewController.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ViewController.swift; sourceTree = "<group>"; };
		F424E6A82C12D4AA00768F3A /* Main.storyboard */ = {isa = PBXFileReference; lastKnownFileType = file.storyboard; path = Main.storyboard; sourceTree = "<group>"; };
		F424E6B32C12D53900768F3A /* libsoftethervpn.a */ = {isa = PBXFileReference; lastKnownFileType = archive.ar; path = ../lib/libsoftethervpn.a; sourceTree = "<group>"; };
		F424E6B52C12D56B00768F3A /* WorxVPN_TestApp-Bridging-Header.h */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = "WorxVPN_TestApp-Bridging-Header.h"; sourceTree = "<group>"; };
/* End PBXFileReference section */

/* Begin PBXFrameworksBuildPhase section */
		F424E69D2C12D4A900768F3A /* Frameworks */ = {
			isa = PBXFrameworksBuildPhase;
			buildActionMask = 2147483647;
			files = (
				F424E6B42C12D53900768F3A /* libsoftethervpn.a in Frameworks */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXFrameworksBuildPhase section */

/* Begin PBXGroup section */
		F424E6972C12D4A900768F3A = {
			isa = PBXGroup;
			children = (
				F424E6A22C12D4A900768F3A /* WorxVPN_TestApp */,
				F424E6A12C12D4A900768F3A /* Products */,
			);
			sourceTree = "<group>";
		};
		F424E6A12C12D4A900768F3A /* Products */ = {
			isa = PBXGroup;
			children = (
				F424E6A02C12D4A900768F3A /* WorxVPN_TestApp.app */,
			);
			name = Products;
			sourceTree = "<group>";
		};
		F424E6A22C12D4A900768F3A /* WorxVPN_TestApp */ = {
			isa = PBXGroup;
			children = (
				F424E6A32C12D4AA00768F3A /* AppDelegate.swift */,
				F424E6A52C12D4AA00768F3A /* ViewController.swift */,
				F424E6A82C12D4AA00768F3A /* Main.storyboard */,
				F424E6B52C12D56B00768F3A /* WorxVPN_TestApp-Bridging-Header.h */,
				F424E6B32C12D53900768F3A /* libsoftethervpn.a */,
			);
			path = WorxVPN_TestApp;
			sourceTree = "<group>";
		};
/* End PBXGroup section */

/* Begin PBXNativeTarget section */
		F424E69F2C12D4A900768F3A /* WorxVPN_TestApp */ = {
			isa = PBXNativeTarget;
			buildConfigurationList = F424E6B22C12D4A900768F3A /* Build configuration list for PBXNativeTarget "WorxVPN_TestApp" */;
			buildPhases = (
				F424E69C2C12D4A900768F3A /* Sources */,
				F424E69D2C12D4A900768F3A /* Frameworks */,
				F424E69E2C12D4A900768F3A /* Resources */,
			);
			buildRules = (
			);
			dependencies = (
			);
			name = WorxVPN_TestApp;
			productName = WorxVPN_TestApp;
			productReference = F424E6A02C12D4A900768F3A /* WorxVPN_TestApp.app */;
			productType = "com.apple.product-type.application";
		};
/* End PBXNativeTarget section */

/* Begin PBXProject section */
		F424E6982C12D4A900768F3A /* Project object */ = {
			isa = PBXProject;
			attributes = {
				LastUpgradeCheck = 1430;
			};
			buildConfigurationList = F424E69B2C12D4A900768F3A /* Build configuration list for PBXProject "WorxVPN_TestApp" */;
			compatibilityVersion = "Xcode 14.0";
			developmentRegion = en;
			hasScannedForEncodings = 0;
			knownRegions = (
				en,
				Base,
			);
			mainGroup = F424E6972C12D4A900768F3A;
			productRefGroup = F424E6A12C12D4A900768F3A /* Products */;
			projectDirPath = "";
			projectRoot = "";
			targets = (
				F424E69F2C12D4A900768F3A /* WorxVPN_TestApp */,
			);
		};
/* End PBXProject section */

/* Begin PBXResourcesBuildPhase section */
		F424E69E2C12D4A900768F3A /* Resources */ = {
			isa = PBXResourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				F424E6A92C12D4AB00768F3A /* Main.storyboard in Resources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXResourcesBuildPhase section */

/* Begin PBXSourcesBuildPhase section */
		F424E69C2C12D4A900768F3A /* Sources */ = {
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				F424E6A62C12D4AA00768F3A /* ViewController.swift in Sources */,
				F424E6A42C12D4AA00768F3A /* AppDelegate.swift in Sources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXSourcesBuildPhase section */

/* Begin XCBuildConfiguration section */
		F424E6B02C12D4A900768F3A /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				HEADER_SEARCH_PATHS = "$(SRCROOT)/lib/includes";
				LIBRARY_SEARCH_PATHS = "$(SRCROOT)/lib";
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_OBJC_BRIDGING_HEADER = "WorxVPN_TestApp/WorxVPN_TestApp-Bridging-Header.h";
				SWIFT_VERSION = "5.0";
        TARGETED_DEVICE_FAMILY = "1,2";
        ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
        INFOPLIST_FILE = WorxVPN_TestApp/Info.plist;
        PRODUCT_BUNDLE_IDENTIFIER = "com.example.WorxVPN-TestApp";
			};
			name = Debug;
		};
		F424E6B12C12D4A900768F3A /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				HEADER_SEARCH_PATHS = "$(SRCROOT)/lib/includes";
				LIBRARY_SEARCH_PATHS = "$(SRCROOT)/lib";
				PRODUCT_NAME = "$(TARGET_name)";
				SWIFT_OBJC_BRIDGING_HEADER = "WorxVPN_TestApp/WorxVPN_TestApp-Bridging-Header.h";
				SWIFT_VERSION = "5.0";
        TARGETED_DEVICE_FAMILY = "1,2";
        ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
        INFOPLIST_FILE = WorxVPN_TestApp/Info.plist;
        PRODUCT_BUNDLE_IDENTIFIER = "com.example.WorxVPN-TestApp";
			};
			name = Release;
		};
		F424E6AF2C12D4A900768F3A /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				PRODUCT_NAME = "$(TARGET_NAME)";
			};
			name = Debug;
		};
		F424E6AE2C12D4A900768F3A /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				PRODUCT_NAME = "$(TARGET_NAME)";
			};
			name = Release;
		};
/* End XCBuildConfiguration section */

/* Begin XCConfigurationList section */
		F424E69B2C12D4A900768F3A /* Build configuration list for PBXProject "WorxVPN_TestApp" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				F424E6AF2C12D4A900768F3A /* Debug */,
				F424E6AE2C12D4A900768F3A /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
		F424E6B22C12D4A900768F3A /* Build configuration list for PBXNativeTarget "WorxVPN_TestApp" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				F424E6B02C12D4A900768F3A /* Debug */,
				F424E6B12C12D4A900768F3A /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
/* End XCConfigurationList section */
	};
	rootObject = F424E6982C12D4A900768F3A /* Project object */;
}
EOF

echo "Project structure created successfully."
echo "Next steps:"
echo "1. Place your 'libsoftethervpn.a' file in 'WorxVPN_TestApp/lib/'"
echo "2. Place your header files (e.g., vpn.h) in 'WorxVPN_TestApp/lib/includes/'"
echo "3. Add the GitHub Actions workflow to '.github/workflows/'"
echo "4. Commit and push to GitHub."