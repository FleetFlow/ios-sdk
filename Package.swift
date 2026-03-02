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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta40/FleetFlowSDK.xcframework.zip",
            checksum: "1d9a5dd13065a6af32c56897b8e48d66ae1535026225b7e30168fca35259dfc7"
        )
    ]
)
