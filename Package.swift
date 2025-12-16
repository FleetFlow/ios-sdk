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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta26/FleetFlowSDK.xcframework.zip",
            checksum: "c16682cdff8627e52983bd492781a9b5d07e2d677b7b3e45ef1624fb9d98bd2d"
        )
    ]
)
