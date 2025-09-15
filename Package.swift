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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta4/FleetFlowSDK.xcframework.zip",
            checksum: "65efd258fc6c932b684d1d5d43f69afdd0207eaf0327907cfa5cd28420959468"
        )
    ]
)
