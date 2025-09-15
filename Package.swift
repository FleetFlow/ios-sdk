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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta1/FleetFlowSDK.xcframework.zip",
            checksum: "754bdc743c8b4114864b396510610bcf2f19cf48b8fc304ed4904dd0da100083"
        )
    ]
)
