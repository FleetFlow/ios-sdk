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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.4/FleetFlowSDK.xcframework.zip",
            checksum: "54c8e42cbea63ca83b7796ae770f43099263094338d1d4b43762a0e323c36926"
        )
    ]
)
