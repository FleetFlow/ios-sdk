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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.1.3/FleetFlowSDK.xcframework.zip",
            checksum: "5b1ad4c908ef011e0b24a438546a17166e8895ab5b58e690b59cb09693a7c7e5"
        )
    ]
)
