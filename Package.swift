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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta33/FleetFlowSDK.xcframework.zip",
            checksum: "2bcee14a3b09efb2def230331a7325ae4726afbb3ccfd7aabe1dab43c61cb415"
        )
    ]
)
