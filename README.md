# FleetFlow Swift SDK

The **FleetFlow Swift SDK** provides an easy and type-safe way to interact with the FleetFlow API in your iOS applications. This SDK supports modern Swift features and follows iOS best practices while maintaining feature parity with the JavaScript SDK.

## Features

- **✨ Modern Swift API** - Built with async/await and modern Swift features
- **🔐 Secure Authentication** - Handles tokens and refresh logic securely
- **🔄 Automatic Token Refresh** - Manages token refresh automatically
- **💾 iOS Native Storage** - Uses UserDefaults for secure token storage
- **⚡️ Type-Safe API** - Leverages Swift's type system for safety
- **🧩 Flexible Resource Access** - Supports nested resources and dynamic paths
- **📱 iOS-Optimized** - Built specifically for iOS and follows platform conventions

## Installation

### Swift Package Manager

Add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/FleetFlow/ios-sdk.git", from: "1.0.0")
	.package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "5.0.0")
]
```

## Quick Start

### Initialize the SDK

```swift
// Basic initialization
let fleetFlow = FleetFlowSDK()

// Custom domain initialization
let fleetFlow = FleetFlowSDK(baseURL: "custom-deployment.com")

// Initialize with custom headers
let fleetFlow = FleetFlowSDK(
    baseURL: "fleetflow.io",
    headers: [
        "X-Api-Key": "1b06abdb-6bcb-438c-b9fd-cb9d7e451a71",
        "X-User-Type": "fleetflow"
    ]
)
```

### Authentication

```swift
// Platform user authentication
do {
    let auth: AuthResponse = try await fleetFlow.platform.v1.auth.get([
        "email": "john@doe.com",
        "password": "******"
    ])
    print("Authenticated successfully")
} catch {
    print("Authentication failed: \(error)")
}

// Customer authentication
let fleetFlow = FleetFlowSDK(
    baseURL: "fleetflow.io",
    headers: [
        "X-Api-Key": "{organization.api_key}",
        "X-User-Type": "fleetflow"
    ]
)

do {
    let auth: AuthResponse = try await fleetFlow.customer.v3.auth.get([
        "email": "john@doe.com",
        "password": "******"
    ])
    print("Customer authenticated successfully")
} catch {
    print("Customer authentication failed: \(error)")
}
```

## Working with Resources

### Basic CRUD Operations

```swift
// Get all articles
let articles: [Article] = try await fleetFlow.organization.v1.articles.get()

// Get a specific article
let article: Article = try await fleetFlow.organization.v1.articles("article_uuid").get()

// Create a new article
let newArticle: Article = try await fleetFlow.organization.v1.articles.post([
    "title": "New Article",
    "text": "Hello world!"
])

// Update an article
let updatedArticle: Article = try await fleetFlow.organization.v1.articles("article_uuid").patch([
    "title": "Updated Article"
])

// Delete an article
try await fleetFlow.organization.v1.articles("article_uuid").delete()
```

### Working with Nested Resources

```swift
// Get all reviews for an article
let reviews: [Review] = try await fleetFlow.organization.v1.articles("article_uuid").reviews.get()

// Get a specific review
let review: Review = try await fleetFlow.organization.v1.articles("article_uuid").reviews("review_uuid").get()

// Create a review
let newReview: Review = try await fleetFlow.organization.v1.articles("article_uuid").reviews.post([
    "stars": 5,
    "text": "Great article!"
])

// Update a review
let updatedReview: Review = try await fleetFlow.organization.v1.articles("article_uuid").reviews("review_uuid").patch([
    "stars": 4
])

// Delete a review
try await fleetFlow.organization.v1.articles("article_uuid").reviews("review_uuid").delete()
```

## Error Handling

The SDK uses Swift's error handling system with custom `FleetFlowError` types:

```swift
do {
    let article: Article = try await fleetFlow.organization.v1.articles("invalid_uuid").get()
} catch FleetFlowError.unauthorized {
    print("Authentication required")
} catch FleetFlowError.apiError(let message) {
    print("API error: \(message)")
} catch {
    print("Unknown error: \(error)")
}
```

## Additional Features

### Token Management

```swift
// Set tokens manually
fleetFlow.setToken(token: "access_token", refreshToken: "refresh_token")

// Clear tokens (logout)
fleetFlow.unsetToken()
```

### Headers Management

```swift
// Set API key
fleetFlow.setApiKey("your-api-key")

// Set user type
fleetFlow.setUserType("customer")
```

### Profile Management

```swift
// Refresh user profile
try await fleetFlow.refreshProfile()
```

## API Reference

### Available APIs

- `platform` - Platform API access
- `organization` - Organization API access
- `partner` - Partner API access
- `customer` - Customer API access
- `orchestrator` - Orchestrator API access
- `admin` - Admin API access

### HTTP Methods

- `get([String: Any]?)` - GET request with optional query parameters
- `post([String: Any])` - POST request with body data
- `patch([String: Any])` - PATCH request with body data
- `delete()` - DELETE request

## Error Types

```swift
public enum FleetFlowError: Error {
    case invalidResponse
    case unauthorized
    case failedToRefreshToken
    case apiError(message: String)
}
```

## Threading

The SDK uses Swift's structured concurrency (async/await) and is thread-safe. All network operations are performed asynchronously and token refresh operations are properly synchronized.

## Requirements

- iOS 13.0+ / macOS 10.15+
- Swift 5.5+
- Xcode 13.0+

## Best Practices

1. **Error Handling**: Always wrap SDK calls in do-catch blocks
2. **Type Safety**: Use proper type annotations when calling get/post/patch methods
3. **Token Management**: Let the SDK handle token refresh automatically
4. **Configuration**: Initialize the SDK once and reuse the instance

## Support

For support, please visit:
- Documentation: https://docs.fleetflow.io
- Issues: https://github.com/FleetFlow/swift-sdk/issues
- Email: support@fleetflow.io

## License

This SDK is released under the MIT License. See [LICENSE](LICENSE) for details.