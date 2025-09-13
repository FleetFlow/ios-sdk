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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.0-beta4/FleetFlowSDK.xcframework.zip",
            checksum: "515642a56eefc3d515677a90d8298526bb824ed0d0043790ea165897a7c2d80d"
        )
    ]
)
