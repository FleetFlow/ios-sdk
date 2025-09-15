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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta3/FleetFlowSDK.xcframework.zip",
            checksum: "78fc1ecc0c7cdab0935467d8a6c5d4bfbc247ca21e257f962308681a1941d8df"
        )
    ]
)
