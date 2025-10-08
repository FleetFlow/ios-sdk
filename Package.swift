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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta18/FleetFlowSDK.xcframework.zip",
            checksum: "159fe7ef743bb1ab076361f8a551bc9ac01a5c18db72732aca8c40d3ddfbf6b7"
        )
    ]
)
