// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PDClient",
    platforms: [
        .iOS(.v15),
        .macOS(.v13),
    ],
    products: [
        .library(name: "PDClient", targets: ["PDClient"]),
    ],
    dependencies: [
        .package(name: "PDLoadTesting", path: "../PDLoadTesting"),
        .package(name: "PDFileProvider", path: "../PDFileProvider"),
        .package(name: "PDLocalization", path: "../PDLocalization"),
        .package(name: "PDCore", path: "../PDCore"),
        .package(name: "PDUploadVerifier", path: "../PDUploadVerifier"),

        // exact version is defined by protoncore_ios
        .package(url: "https://github.com/ProtonMail/protoncore_ios.git", .suitable),
        .package(url: "https://github.com/ProtonMail/apple-fusion.git", .suitable),
        .package(url: "https://github.com/getsentry/sentry-cocoa.git", .suitable),
        .package(url: "https://github.com/Unleash/unleash-proxy-client-swift.git", .suitable),
    ],
    targets: [
        .target(
            name: "PDClient",
            dependencies: [
                .product(name: "PDLoadTesting", package: "PDLoadTesting"),
                .product(name: "PDFileProvider", package: "PDFileProvider"),
                .product(name: "PDLocalization", package: "PDLocalization"),
                .product(name: "PDCore", package: "PDCore"),
                .product(name: "PDUploadVerifier", package: "PDUploadVerifier"),

                .product(name: "ProtonCoreUtilities", package: "protoncore_ios"),
                .product(name: "ProtonCoreNetworking", package: "protoncore_ios"),
                .product(name: "ProtonCoreServices", package: "protoncore_ios"),

                .product(name: "Sentry", package: "sentry-cocoa"),
                .product(name: "UnleashProxyClientSwift", package: "unleash-proxy-client-swift"),
            ],
            path: "PDClient"
        ),
    ]
)

extension Range where Bound == Version {
    static let suitable = Self(uncheckedBounds: ("0.0.0", "99.0.0"))
}
