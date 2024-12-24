// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PDLogin-macOS",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .library(name: "PDLogin-macOS", targets: ["PDLogin-macOS"]),
    ],
    dependencies: [
        .package(name: "PDLoadTesting", path: "../PDLoadTesting"),
        .package(name: "PDFileProvider", path: "../PDFileProvider"),
        .package(name: "PDLocalization", path: "../PDLocalization"),
        .package(name: "PDCore", path: "../PDCore"),
        .package(name: "PDUploadVerifier", path: "../PDUploadVerifier"),

        // exact version is defined by PDClient
        .package(url: "https://github.com/ProtonMail/protoncore_ios.git", .suitable),
        .package(name: "PDUIComponents", path: "../PDUIComponents"),
    ],
    targets: [
        .target(
            name: "PDLogin-macOS",
            dependencies: [
                .product(name: "ProtonCoreLoginUI", package: "protoncore_ios"),
                .product(name: "PDLoadTesting", package: "PDLoadTesting"),
                .product(name: "PDFileProvider", package: "PDFileProvider"),
                .product(name: "PDLocalization", package: "PDLocalization"),
                .product(name: "PDCore", package: "PDCore"),
                .product(name: "PDUploadVerifier", package: "PDUploadVerifier"),
            ],
            path: "PDLogin-macOS",
            resources: [
                .process("Resources")
            ]
        ),
    ]
)

extension Range where Bound == Version {
    static let suitable = Self(uncheckedBounds: ("0.0.0", "99.0.0"))
}
