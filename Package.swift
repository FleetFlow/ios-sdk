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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta15/FleetFlowSDK.xcframework.zip",
            checksum: "ee6a52306238e26416ba73f8720b3b5e306e739fbfb84d59ffd67936dd0f116f"
        )
    ]
)
