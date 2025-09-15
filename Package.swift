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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta2/FleetFlowSDK.xcframework.zip",
            checksum: "fa44e8243071847c15a20da2e2fd2d5ee1ef8268f03b86899036f4273ad00f14"
        )
    ]
)
