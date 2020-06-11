// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ESUIHelper",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .watchOS(.v6),
        .tvOS(.v13)
    ],
    products: [
        .library(name: "ESUIHelper", targets: ["ESUIHelper"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "ESUIHelper", dependencies: []),
        .testTarget(name: "ESUIHelperTests", dependencies: ["ESUIHelper"]),
    ]
)
