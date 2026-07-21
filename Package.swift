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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.2.0/FleetFlowSDK.xcframework.zip",
            checksum: "2cce93b8bd19fc7ea4235937b677e9e0780987311a9fced89fb44ddc9f6f0490"
        )
    ]
)
