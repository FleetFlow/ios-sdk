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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.3.1/FleetFlowSDK.xcframework.zip",
            checksum: "677487e8877d581dd8346f040ca35e586a521a0b4870960a88fd8810ecea7a73"
        )
    ]
)
