# FleetFlow iOS SDK

The FleetFlow iOS SDK provides a native Swift integration layer for authentication, API requests, realtime updates, and diagnostics.

It is designed to help you ship faster with async/await-friendly APIs and built-in session handling, instead of wiring each integration piece yourself.

Requires iOS 18 or later.

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

## Authentication

Use `login()` for FleetFlow's hosted OAuth experience:

```swift
try await FleetFlow.shared.login()
```

First-party iOS apps can also present their own native email-code UI. The SDK
still completes OAuth with authorization code + PKCE and stores the resulting
access and refresh tokens securely:

```swift
try await FleetFlow.shared.sendLoginCode(to: email)
try await FleetFlow.shared.login(email: email, oneTimeCode: code)
```

To prefer passkeys when an account has one, resolve its methods before choosing
the next screen:

```swift
let methods = try await FleetFlow.shared.loginMethods(for: email)

if methods.passkey {
    try await FleetFlow.shared.loginWithPasskey(email: email)
} else {
    try await FleetFlow.shared.sendLoginCode(to: email)
}
```

After an email-code sign-in, apps can offer passkey registration while the
short-lived authentication session is still available:

```swift
if methods.passkeyRegistration && !methods.passkey {
    try await FleetFlow.shared.createPasskey(name: "My app · \(email)")
} else {
    FleetFlow.shared.finishNativePasskeySetup()
}
```

Native passkeys also require the host app to enable Associated Domains with
`webcredentials:auth.fleetflow.io`. FleetFlow must list the app's team and
bundle identifier in the domain's Apple App Site Association file.

The native flow uses the authentication methods and organization boundary of
the configured OAuth client. It does not expose or store a password in the app.

## Full documentation

Start with the official docs at the **iOS SDK** tab:

- https://developer.fleetflow.io?sdk=ios
