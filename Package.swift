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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta23/FleetFlowSDK.xcframework.zip",
            checksum: "fe53196821c5b46b876ca307dc0ac02496f1fe44bbf5eda0e6f84088c41e2a69"
        )
    ]
)
