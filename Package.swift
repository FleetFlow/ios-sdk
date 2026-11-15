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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v2.0.2/FleetFlowSDK.xcframework.zip",
            checksum: "70fb92dfcca0f157c30c445351b6340c77833fbc8e4902e806419640ec0ee57b"
        )
    ]
)
