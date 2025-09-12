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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.0-beta1/FleetFlowSDK.xcframework.zip",
            checksum: "1794d61ab61dc3fce81c642e95314d9289eb588293cb0134f60f441ffd3fadac"
        )
    ]
)
