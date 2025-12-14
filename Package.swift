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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta21/FleetFlowSDK.xcframework.zip",
            checksum: "bfd6969ad8556bea50322549495817f78bf31125b85b97742f46ff2ab679e2fe"
        )
    ]
)
