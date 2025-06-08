# WorxVPN TestApp

Welcome to the WorxVPN TestApp project!  
This repository contains a demo iOS app and the WorxVPN library.  
Follow these steps to get started, build, run, or develop further on your Mac.

---

## Prerequisites

- **A Mac** running macOS 13 or later
- **Xcode 15 or newer** (available from the Mac App Store)
- (If using CocoaPods) [CocoaPods](https://cocoapods.org/) installed (`sudo gem install cocoapods`)

---

## 1. Clone the Repository

Open Terminal and run:

```sh
git clone https://github.com/orkinosai/WorxVPN_Phase1_CompleteFinal.git
cd WorxVPN_Phase1_CompleteFinal
```

---

## 2. Install Dependencies

**If your project uses CocoaPods:**

```sh
pod install
```
- Open `TestApp.xcworkspace` in Xcode.

**If your project uses Swift Package Manager:**

- Open the project in Xcode and let it resolve Swift Packages automatically.

**If there are prebuilt libraries (.a, .framework, .dylib, etc):**

- Ensure these files are in the correct locations as described in the repo or by your project lead.

---

## 3. Open in Xcode

- For CocoaPods: open `TestApp.xcworkspace`
- Otherwise: open `TestApp.xcodeproj`

---

## 4. Build the App

1. In Xcode, select the **TestApp** scheme.
2. Choose a simulator or your connected device.
3. Build via **Product > Build** or press <kbd>⌘B</kbd>.

---

## 5. Run the App

- Click the **Run** button in Xcode or press <kbd>⌘R</kbd>.

---

## 6. Running Tests (If Available)

- Select the test scheme (e.g. `TestAppTests`) and press <kbd>⌘U</kbd>  
  *(If there are no tests, you can skip this step.)*

---

## 7. Continue Development

- Make changes as needed.
- Use standard Git commands (`git pull`, `git commit`, `git push`) to manage your work.
- Update dependencies if you add new pods or packages.

---

## 8. Troubleshooting

- **Build errors:** Ensure all required libraries/frameworks are present and correctly referenced.
- **Code signing issues:** For local testing on Simulator, you can set `CODE_SIGNING_ALLOWED=NO` in your build command or Xcode scheme.
- **Dependency errors:** Run `pod install` (for CocoaPods) or let Xcode resolve packages.

---

## 9. Support

For questions or issues, please contact [your project lead] or open an Issue.

---

*Happy building!*