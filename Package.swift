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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.1.4/FleetFlowSDK.xcframework.zip",
            checksum: "6359eb860c1e0064c93151a7d203b604c32b14a770f78e966ca1190601334ac5"
        )
    ]
)
