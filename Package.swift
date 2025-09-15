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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta13/FleetFlowSDK.xcframework.zip",
            checksum: "20a30695c1a16e65403b85f090c34014d6ed189bb72cd4c9cd21a23834ece8cd"
        )
    ]
)
