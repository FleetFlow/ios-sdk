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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v2.0.3/FleetFlowSDK.xcframework.zip",
            checksum: "d7accd40417e5d47f6426c166e909449d78be9e0f4591aba34c50896b026696f"
        )
    ]
)
