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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v2.0.4/FleetFlowSDK.xcframework.zip",
            checksum: "39ad990450d25c3cc8d5a385058a7a207cf41d077939845b2efa321d257b7fd9"
        )
    ]
)
