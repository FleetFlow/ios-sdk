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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta32/FleetFlowSDK.xcframework.zip",
            checksum: "1d1985e38441aeef3491622121acc098a1db5178baaec249789e6bb3fe2b458b"
        )
    ]
)
