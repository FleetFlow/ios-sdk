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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.2.2/FleetFlowSDK.xcframework.zip",
            checksum: "665b0094c1c5e5d74aad119f71fc92b3d2a3f1daff95713c85ed41553dadd68c"
        )
    ]
)
