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

The iOS SDK is distributed as a Swift Package. To add it to your app in Xcode:

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

Then add the products you use to your app target. Each is a signed binary XCFramework; the package brings in what
it needs (SwiftyJSON, and TwilioVoice for `FleetFlowVoice`).

| Product | What it is |
|---|---|
| `FleetFlowSDK` | Authentication, API requests, realtime, diagnostics. |
| `FleetFlowThreads` | Customer support threads: models, stores, REST and socket. |
| `FleetFlowThreadsUI` | SwiftUI components for threads (message rows, call cards, composer, ...). |
| `FleetFlowArticles` | Help-centre articles and collections, their renderer and the in-app link handler. |
| `FleetFlowVoice` | In-app calls to the organization (Twilio Voice). |

```swift
.product(name: "FleetFlowThreadsUI", package: "ios-sdk")
```

## Custom authentication URL

Pass the optional `authenticationURL` origin to use a verified FleetFlow custom authentication domain. Use an HTTP(S) origin without a path, query, fragment, or credentials; a trailing slash is accepted. Omit it (or pass `nil`/`null`) to keep the default authentication host. An invalid value is logged and ignored (the default host is used) instead of crashing the app.

```swift
FleetFlow.shared.configure(
    baseURL: "fleetflow.io",
    clientID: "your-client-id",
    redirectURI: "your-app://auth-callback",
    authenticationURL: "https://auth.example.com"
)
```

The SDK saves this setting across launches and uses it for hosted login, native authentication, token exchange, and token refresh. API hosts and the OAuth issuer/audience remain derived from `baseURL`, so changing the authentication origin preserves existing tokens. For native iOS passkeys, include the authentication host in the app's `webcredentials` associated domains; the server must also support that host's passkey origin.

## Authentication

Use `login()` for FleetFlow's hosted OAuth experience:

```swift
try await FleetFlow.shared.login()
```

Use the provider-specific overload for social sign-in. Apple presents the
system Sign in with Apple sheet; Google opens Google's supported iOS
authorization session. Provider tokens are verified by FleetFlow and linked to
the configured customer or platform account by verified email:

```swift
try await FleetFlow.shared.login(with: .google)
try await FleetFlow.shared.login(with: .apple)
```

The host app must enable the **Sign in with Apple** capability. FleetFlow must
also register the app bundle identifier as an accepted native Apple client ID.

Apps that already obtain a native provider identity token can hand it to the
SDK without implementing FleetFlow's linking or OAuth exchange themselves:

```swift
try await FleetFlow.shared.login(
    with: .google,
    idToken: googleIDToken,
    accessToken: googleAccessToken
)
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

When `name` is omitted, the passkey is named after the app's display name and
device (for example "My App on iPhone").

Native passkeys also require the host app to enable Associated Domains with
`webcredentials:auth.fleetflow.io`. FleetFlow must list the app's team and
bundle identifier in the domain's Apple App Site Association file.

The native flow uses the authentication methods and organization boundary of
the configured OAuth client. It does not expose or store a password in the app.

## Sessions, logout and background launches

Tokens are stored in the Keychain with `kSecAttrAccessibleAfterFirstUnlock`, so a
session is available when iOS launches the app in the background (Bluetooth
restoration, push) once the device has been unlocked after boot.

- Before the first unlock the Keychain refuses reads. The SDK treats this as
  "session temporarily unavailable", not as signed out: the cached profile stays
  published, no request is sent without authorization, and the session loads
  automatically once the device is unlocked (or before the next request).
- If the Keychain refuses to save new tokens, they stay in memory and are written
  again before the next request.
- `logout()` revokes the server session best-effort, then always clears the local
  session, cached profile/vehicles and all sockets. If the Keychain can't delete
  the session yet, the logout is completed on the next launch, so the old session
  can never come back.
- A token refresh that finishes after a logout or a new login is discarded.

## Parity

The iOS and Android SDKs implement the same behavior as of 2.0.0. Only the API
shapes differ where each platform has its own idiom.

Behavior that is identical on both platforms includes:

- **Errors:** `APIError.message` is a stable snake_case code for SDK-generated
  errors (for example `invalid_response`, `invalid_token`, `token_exchange_failed`,
  `api_key_not_configured`, `not_authenticated`, `threads_websocket_not_connected`,
  `organization_thread_websocket_not_connected`), or the server's message for API
  errors. `request` and multipart uploads map responses the same way: a non-JSON
  error page is `invalid_response` with its HTTP status, a final 498 is
  `invalid_token` with `httpCode` 498. Native sign-in validation errors
  (for example "Enter a valid email address.") are user-facing text on both platforms.
- **Profile and vehicles:** customer users load `account` and their vehicles from
  customer-api v5; organization users load `account` and the organization's
  vehicles from organization-api v1. The previous selection is kept when it still
  exists, otherwise the first vehicle (sorted by UUID) is selected. The selected
  vehicle loads its details and `products`; a failing products request keeps the
  vehicle with an empty `products` list, a failing vehicle request clears it.
- **Thread sockets:** each connect request reports its initial outcome exactly
  once (opened, or failed to open). Automatic reconnects (exponential backoff from
  2s up to 60s) don't report again; messages keep arriving through `onMessage`, and
  sending while disconnected throws `*_websocket_not_connected`. A new connect
  request replaces the previous one and drops its pending callback.
- **Realtime outbox:** `queueRealtimeWebSocketMessage` keeps a message in memory
  until the realtime socket takes it, connecting when needed and sending queued
  messages in order whenever the socket opens, so samples recorded while the socket
  is down (for example in the background) aren't lost. `flushRealtimeWebSocketOutbox`
  waits up to a timeout for the queue to drain (for example before an API call that
  depends on the queued samples), and `pendingRealtimeWebSocketMessageCount` reports
  what is still queued. The queue keeps at most `realtimeWebSocketOutboxLimit`
  messages (20,000, oldest dropped first) and is cleared on sign-out.
  `sendRealtimeWebSocketMessage` still sends once and fails when the socket is down.
- **Diagnostics:** the SDK's own app-session starts (enabling diagnostics,
  returning to the foreground, sign-in) are best effort: a failure is logged, never
  fails that flow, and no app session is stored.

Platform-idiomatic differences:

| | iOS | Android |
|---|---|---|
| Async model | `async throws`, `@Published` properties | `suspend` functions, `StateFlow`s |
| Hosted login | Native Apple authentication sheet (`ASWebAuthenticationSession`); Sign in with Apple uses the system sheet | Custom Tabs; forward the redirect with `FleetFlow.handleOAuthRedirect(uri)` |
| Token storage | Keychain (`kSecAttrAccessibleAfterFirstUnlock`) | `EncryptedSharedPreferences` backed by the Android Keystore |
| Push token | `setAPNSToken` | `setFCMToken` |
| Thread socket callbacks | `completion: (Result<Void, Error>)` | `onConnected` / `onFailure` |
| Customer threads socket | `connectToThreadsWebSocket` / `disconnectFromThreadsWebSocket` | `connectThreadsWebSocket` / `disconnectThreadsWebSocket` |
| `startAppSession` | `async throws` (direct callers see the error) | `suspend`, swallows the error (no crash in a background scope) |
| API builders | Dynamic members for any API (`customer("v5").vehicles(uuid).get()`) | `customer`, `organization`, `partner`, `admin`, `orchestrator` with `path(...)` |
| Error text | `APIError.message` (also `errorDescription`) | `APIError.message` |
| Realtime outbox flush | `flushRealtimeWebSocketOutbox(timeout:)` in seconds; a message leaves the queue once the socket confirms sending it | `flushRealtimeWebSocketOutbox(timeoutMs)`; a message leaves the queue once OkHttp's socket accepts it into its own send queue |

Android also has `connectVehicleWebSocket` / `disconnectVehicleWebSocket` /
`writeVehicleStream` aliases for the realtime socket. iOS also has
`loginWithApple()` as a shortcut for `login(with: .apple)`.

## Customer threads socket: extra query parameters

`connectToThreadsWebSocket` takes optional `queryItems`, appended to the socket URL on every
(re)connect after the credentials (they can't replace `X-Api-Key` or `Authorization`). Existing
call sites keep compiling:

```swift
FleetFlow.shared.connectToThreadsWebSocket(
    threadUUID: uuid,
    queryItems: [URLQueryItem(name: "include_kinds", value: "call")],
    onMessage: { payload in /* ... */ },
    completion: { result in /* ... */ }
)
```

## Threads, thread components and articles

Three optional products, so apps that don't use them don't link them. The SDK ships components,
not screens: apps build their own list, thread and welcome screens from them.

| Product | Depends on | What it has |
|---|---|---|
| `FleetFlowThreads` | `FleetFlowSDK` | Models, lenient decoding, `FFThreadListStore`, `FFThreadStore`, REST + socket. No UI. |
| `FleetFlowThreadsUI` | `FleetFlowThreads`, `FleetFlowArticles` | SwiftUI components: message rows, call cards, audio player, attachments, composer, typing indicator, thread rows. |
| `FleetFlowArticles` | `FleetFlowSDK` | Article and collection models and stores, `FFArticleContentView`, `FFMarkdownText`, the link handler. |

Add the products you need to the app target (Xcode: the target's **Frameworks, Libraries, and
Embedded Content**; SwiftPM: `.product(name: "FleetFlowThreadsUI", package: "ios-sdk")`). For local
development, reference the package folder (`packages/ios-sdk`) as a local package (Xcode **Add
Package Dependencies... > Add Local...**, or `.package(path: "../FleetFlow/packages/ios-sdk")`).

### FleetFlowThreads

Everything goes to customer-api v5 with `include_kinds=call` (REST and socket), so calls and
voicemails show in the conversation.

```swift
import FleetFlowThreads

// The customer's threads, newest activity first.
@StateObject private var list = FFThreadListStore()
// .task { await list.load() }  .refreshable { await list.refresh() }
// await list.delete(uuid)      await list.close(uuid)

// One conversation; nil starts a new one (the uuid arrives with `thread_created`).
@StateObject private var store = FFThreadStore(threadUUID: uuid)
// .task { await store.start() }   .onDisappear { store.stop() }

store.messages              // renderable messages, ascending (FFThreadMessage)
store.isEmptyConversation   // show the app's welcome view only when true
store.title                 // streamed and stored titles
store.isAssistantTyping     // assistant working, no text visible yet
store.isAgentTyping
store.vehicleSelection      // the assistant asks which vehicle: answer with
try await store.selectVehicle(vehicle)
store.send(text: text, attachments: files) // optimistic; failures get .failed for retry
store.retry(message.id); store.discard(message.id)
store.composerTextChanged(text)            // typing status for the team
try await store.closeThread()
let url = try await store.recordingURL(call: call, source: .voicemail) // or .index(0)
```

There is one customer threads socket per app: keep one started `FFThreadStore` at a time.
`FFThreadReducer.reduce(&state, event)` is the pure event reducer the store uses, and
`FFThreadsService` (default `FFThreadsAPI`) can be replaced for tests and previews.

Models: `FFThread` (`status: FFThreadStatus`, `isCallThread`, `previewText`), `FFThreadMessage`
(`role: FFThreadMessageRole`, `kind: FFThreadMessageKind`, `text`, `sender`, `attachments`,
`call`, `sendState`, `isStreaming`, `isRenderable`), `FFThreadAttachment` (image, video, pdf, file,
article), `FFCallLog` (voicemail, recordings, transcript, `outcome`). Unknown roles and kinds decode
to `.unknown(raw)` and aren't rendered; a broken item never fails a whole list.

### FleetFlowThreadsUI

```swift
import FleetFlowThreadsUI
import FleetFlowArticles

ScrollView {
    LazyVStack(spacing: 12) {
        ForEach(store.messages) { message in
            FFThreadMessageRow(message: message, store: store)
        }
        if store.isAssistantTyping { FFTypingIndicator(label: FFThreadsStrings.default.assistant) }
    }
}
.safeAreaInset(edge: .bottom) {
    FFComposer(text: $text, attachments: pending, onAttach: { showPicker = true },
               onRemoveAttachment: { a in pending.removeAll { $0.id == a.id } }) {
        store.send(text: text, attachments: pending)
        text = ""; pending = []
    }
}
.onChange(of: text) { store.composerTextChanged($1) }
.ffThreadsTheme(FFThreadsTheme(customerBubble: .black, teamBubble: Color("Block")))
.ffLinkHandler(onOpenArticle: { uuid in openedArticle = uuid })
```

- `FFThreadMessageRow` picks the customer bubble, team/assistant bubble (with the sender's name),
  system caption or `FFCallLogCard`; unknown messages render nothing.
- `FFCallLogCard(call:timestamp:recordingProvider:)` plays the voicemail and recordings with
  `FFAudioPlayerView` (fetched on first play, downloaded, then AVAudioPlayer) and shows the transcript.
- `FFAttachmentGrid` / `FFAttachmentView`, `FFArticleCard`, `FFImagePreview`, `FFThreadRow`,
  `FFTypingIndicator`, `FFComposer`, and `FFOutgoingAttachment.jpeg(_:)` / `.file(at:)`.
- Strings come from the SDK's tables (en, nl, de, fr, es). Override them with
  `FFThreadsTheme(strings: FFThreadsStrings(overrides: [...], provider: { key in ... }))`.

### FleetFlowArticles

```swift
import FleetFlowArticles

@StateObject private var article = FFArticleStore(articleUUID: uuid)
// .task { await article.load() }
ScrollView {
    if let loaded = article.article {
        Text(loaded.title() ?? "")
        FFArticleContentView(article: loaded) // content in the preferred language, then English
    }
}
.ffArticlesTheme(FFArticlesTheme(cardBackground: Color("Block")))

@StateObject private var help = FFArticleCollectionStore()            // the collections
@StateObject private var section = FFArticleCollectionStore(collectionUUID: uuid) // one collection
```

`FFArticlesAPI` also has `articles(query:)` and `submitReview(articleUUID:stars:)`.

**Links.** `FFLinkHandler` (`FFThreadLinkHandler` in FleetFlowThreadsUI) opens `article:<uuid>`
and any link whose path has `articles/<uuid>` (`/articles/<uuid>`, `/help/.../articles/<uuid>`)
with the app's `onOpenArticle`; other links go to `onOpenURL`, or by default to an in-app browser
(SFSafariViewController). `FFMarkdownText` renders markdown (headings, lists, emphasis, code,
quotes, links, bare URLs, YouTube thumbnail cards) and sends every tap through the handler.

## Full documentation

Start with the official docs at the **iOS SDK** tab:

- https://account.fleetflow.io/developer/docs?sdk=ios

## Signing binary releases

Every product is released as a signed binary XCFramework. `scripts/build_xcframework.sh` builds the core
(`FleetFlowSDK.xcodeproj`); `scripts/build_addon_xcframeworks.sh` then builds `FleetFlowThreads`,
`FleetFlowThreadsUI`, `FleetFlowArticles` and `FleetFlowVoice` against that core XCFramework (`CORE_XCFRAMEWORK`),
from `release/project.yml` with XcodeGen. The add-ons don't contain SwiftyJSON: they use the copy inside the core.
`scripts/render_public_package.py` writes the public `Package.swift`: each product is its binary plus a small source
target that links the binaries and packages it needs at runtime. For a locally signed build (the workflow's
`signed_build_tag`), upload all five `<Product>.xcframework.zip` files to that private release.

Set `SDK_SIGNING_IDENTITY` to an Apple Development or Apple Distribution identity installed in the build machine's keychain before running the build scripts. The GitHub workflow reads this from the `IOS_SDK_SIGNING_IDENTITY` repository variable. Keep the publisher Team ID consistent across releases.

The script signs the completed XCFramework with an Apple timestamp, verifies it, creates the ZIP without macOS metadata, then verifies an extracted copy before calculating the SwiftPM checksum. Missing signing configuration stops the release.
