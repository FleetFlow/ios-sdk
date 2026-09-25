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
            url: "https://github.com/FleetFlow/ios-sdk/releases/download/v1.4.1/FleetFlowSDK.xcframework.zip",
            checksum: "3608a2020e7c3aac19e96fcebdb191ec0c4cb0e2bc462bbd918c0ed37d57bd61"
        )
    ]
)
