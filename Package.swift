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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v2.0.0/FleetFlowSDK.xcframework.zip",
            checksum: "dd26ae8947f6e3ba095ae17c9b0550c983195b9a048c9a149b4faa2c9eedc5f6"
        )
    ]
)
