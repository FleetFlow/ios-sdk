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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.0.0-beta5/FleetFlowSDK.xcframework.zip",
            checksum: "f0e71de6541ec103134650fcae2692e565151ab63618a42a42bcad7762ec3086"
        )
    ]
)
