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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta5/FleetFlowSDK.xcframework.zip",
            checksum: "97fc8e009210630d9e47cff2d63bdfea58406e331a2cc71e9e627cb9f6996e03"
        )
    ]
)
