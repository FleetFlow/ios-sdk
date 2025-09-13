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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.1/FleetFlowSDK.xcframework.zip",
            checksum: "e4bc2d94936eef9b638ba0b0392b169b78769d9bbe8c56472213bb69cfc6cf21"
        )
    ]
)
