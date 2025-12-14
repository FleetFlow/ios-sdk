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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta20/FleetFlowSDK.xcframework.zip",
            checksum: "67f49f3e9ed52804effa61f31fdcc4b1cf63943ec8f55644e0b52b3de629698b"
        )
    ]
)
