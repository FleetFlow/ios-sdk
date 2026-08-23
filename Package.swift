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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.3.2/FleetFlowSDK.xcframework.zip",
            checksum: "1d99835e466f44257f44130d744b1621e5a8d04cc40da3ed39adbe32826cfe3a"
        )
    ]
)
