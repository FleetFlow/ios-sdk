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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.1.5/FleetFlowSDK.xcframework.zip",
            checksum: "69d1b15426fedfd879f169aab5f9d86fe3b5e27a947a64b9649738e265bbf984"
        )
    ]
)
