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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta24/FleetFlowSDK.xcframework.zip",
            checksum: "ebc3988bc63f11ed22f1eedb17c63a6fe265c9260a26c9c8b3d4d7d59720e405"
        )
    ]
)
