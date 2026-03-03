// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "FleetFlowSDK",
    platforms: [
		.iOS(.v14)
	],
    products: [
        .library(name: "FleetFlowSDK", targets: ["FleetFlowSDK"])
    ],
    targets: [
        .binaryTarget(
            name: "FleetFlowSDK",
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.4/FleetFlowSDK.xcframework.zip",
            checksum: "a9d96c4e8eb6fc778f50af62211615755672b65b1f2a5b2a182918eb714ca82b"
        )
    ]
)
