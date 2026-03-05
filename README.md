# FleetFlow iOS SDK

The FleetFlow iOS SDK provides a native Swift integration layer for authentication, API requests, realtime updates, and diagnostics.

It is designed to help you ship faster with async/await-friendly APIs and built-in session handling, instead of wiring each integration piece yourself.

## Before you jump in

Have these ready:

- OAuth client ID
- Redirect URI configured for your iOS app
- FleetFlow API key (when needed for your use case)

## Installation

The iOS SDK is distributed as a Swift Package from. To add it to your app, follow the following steps in Xcode:

1. Open your project.
2. Go to **File -> Add Package Dependencies...**
3. Enter `https://github.com/FleetFlow/ios-sdk.git`
4. Choose **Up to Next Major Version**

Or add it directly in `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/FleetFlow/ios-sdk.git", from: "{VERSION}")
]
```

## Full documentation

Start with the official docs at the **iOS SDK** tab:

- https://fleetflow.io/docs?sdk=ios