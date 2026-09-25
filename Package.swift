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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.4.2/FleetFlowSDK.xcframework.zip",
            checksum: "14a9ba20cf8f4a71d3502c8ea3a24b038b70adaf1a6a33ab2e6290ecea982bb1"
        )
    ]
)
