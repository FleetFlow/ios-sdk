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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta38/FleetFlowSDK.xcframework.zip",
            checksum: "637d5a06c94d725032005266a867cd9f11e974a7b9d3c5d5666baffddd743649"
        )
    ]
)
