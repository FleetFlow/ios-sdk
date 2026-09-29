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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.5.0/FleetFlowSDK.xcframework.zip",
            checksum: "e93a1cc44af37d9e5119be5952afd0864fbef93563cccb221028b5079d872d6e"
        )
    ]
)
