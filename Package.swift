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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.4.0/FleetFlowSDK.xcframework.zip",
            checksum: "8a7f9dc7f10c621ce013e828389b76bb826d445a1fb5f3198f86a27cb620c86c"
        )
    ]
)
