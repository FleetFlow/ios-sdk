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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.0-beta4/FleetFlowSDK.xcframework.zip",
            checksum: "e00b5178dcdc122d7e0538d2d89b8fc4a6e71d946d16d6a12429ede507e1a4ed"
        )
    ]
)
