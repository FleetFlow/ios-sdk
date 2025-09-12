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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.0-beta2/FleetFlowSDK.xcframework.zip",
            checksum: "9c059accb6bac233c6d5b9af42df6e5f25b1f07e8c8a15e77d1eeef677c39185"
        )
    ]
)
