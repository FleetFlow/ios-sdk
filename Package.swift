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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta16/FleetFlowSDK.xcframework.zip",
            checksum: "d18fb2727b1b1ff63880bdb324b1e23ec1094bb576dd021deb7fb4b308847e1b"
        )
    ]
)
