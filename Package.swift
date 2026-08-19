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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.3.0/FleetFlowSDK.xcframework.zip",
            checksum: "68d3e3d6d817df5e40424cfbe74ea42f877eb72335699f4ac93fa86b501ebf39"
        )
    ]
)
