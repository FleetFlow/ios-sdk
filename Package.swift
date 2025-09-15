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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta9/FleetFlowSDK.xcframework.zip",
            checksum: "53edcbab41bc9c06f2cda8ffdea6e1f7fd5d26366e059e0a91e8f6e9e499a25d"
        )
    ]
)
