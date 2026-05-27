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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.1.0/FleetFlowSDK.xcframework.zip",
            checksum: "77339beaa5ad8552123d2a4c707fd8e0f255b4a9d5d491738c878c43ce0ffd1a"
        )
    ]
)
