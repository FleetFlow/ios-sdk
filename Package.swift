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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta31/FleetFlowSDK.xcframework.zip",
            checksum: "02c8a398b03854595d36f7cabf59356a994c93e0a27cfbab7cc3992d00c857ff"
        )
    ]
)
