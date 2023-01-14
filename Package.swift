// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IdentifiableIndices",
    platforms: [
      .macOS(.v10_15),
      .iOS(.v13)
    ],
    products: [
        .library(
            name: "IdentifiableIndices",
            targets: ["IdentifiableIndices"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "IdentifiableIndices",
            dependencies: [],
            path: "Sources/IdentifiableIndices",
            exclude: ["Info.plist"]),
    ]
)
