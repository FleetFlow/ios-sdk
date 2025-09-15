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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta14/FleetFlowSDK.xcframework.zip",
            checksum: "75cab3435e6a4c4ca2d241d264bac834a1497831891a7394323210fc5423c3d8"
        )
    ]
)
