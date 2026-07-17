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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.1.2/FleetFlowSDK.xcframework.zip",
            checksum: "d78c7100a1628b3380adc0d8ab473ae825fece2110f71004e57bbccca70685a7"
        )
    ]
)
