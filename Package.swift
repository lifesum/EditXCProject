// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EditXCProject",
    dependencies: [
        .package(url: "https://github.com/tomlokhorst/XcodeEdit.git", .exact("2.7.4"))
    ],
    targets: [
        .target(
            name: "EditXCProject",
            dependencies: ["EditXCProjectCore", "XcodeEdit"]),
        .target(
            name: "EditXCProjectCore",
            dependencies: ["XcodeEdit"]),
        .testTarget(
            name: "EditXCProjectTests",
            dependencies: ["EditXCProject"]),
    ]
)
