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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta17/FleetFlowSDK.xcframework.zip",
            checksum: "d00bbdaaec681472e199abefdfbd80d5c560135f0c9c87520bfa03d8cc2b60d2"
        )
    ]
)
