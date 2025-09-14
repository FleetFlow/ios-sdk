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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.2/FleetFlowSDK.xcframework.zip",
            checksum: "72a4dd99261985d75165526cfbe6ca2e13cac466db83172e97ae818543b88431"
        )
    ]
)
