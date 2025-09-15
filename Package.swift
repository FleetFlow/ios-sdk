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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta12/FleetFlowSDK.xcframework.zip",
            checksum: "8de978ca9635c9391259d1ffa226c4130339c38da40ff3cffff8fb38a5caaa17"
        )
    ]
)
