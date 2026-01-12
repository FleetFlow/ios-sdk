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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta34/FleetFlowSDK.xcframework.zip",
            checksum: "24b2613adcc1ff857bc2e0bfa6794e1c3c07f137d6bb9f75a09bb2f68009b2ba"
        )
    ]
)
