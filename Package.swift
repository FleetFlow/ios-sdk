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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.1.1/FleetFlowSDK.xcframework.zip",
            checksum: "78b24bd33d713835f1de1bb9cbb14205f8065ea0a6e5d2fab9a339ccaecacee5"
        )
    ]
)
