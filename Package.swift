// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Logger",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v11),
        .watchOS(.v3),
        .tvOS(.v9),
    ],
    products: [
        .library(
            name: "Logger",
            targets: ["Logger"]
        ),
    ],
    targets: [
        .target(
            name: "Logger",
            dependencies: []
        ),
        .testTarget(
            name: "LoggerTests",
            dependencies: ["Logger"]
        ),
    ]
)
