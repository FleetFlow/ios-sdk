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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.3-beta39/FleetFlowSDK.xcframework.zip",
            checksum: "677ea3546bf44ce02fe1fe494410f35966053f297aa6ec3a95aef8098d421fc1"
        )
    ]
)
