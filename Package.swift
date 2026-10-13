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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v2.0.1/FleetFlowSDK.xcframework.zip",
            checksum: "2c10d0a54c466b5e1c2e2773046e56df7ffd5ee18c034c0b76f40e6f880c1a8b"
        )
    ]
)
