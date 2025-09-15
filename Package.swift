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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta11/FleetFlowSDK.xcframework.zip",
            checksum: "3c86c11e24f7027285660c55984a3b9e0b98c030708bec79e9aecc374fa67277"
        )
    ]
)
