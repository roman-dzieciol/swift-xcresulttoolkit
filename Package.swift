// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "xcresulttoolkit",
    platforms: [.macOS(.v10_15)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .executable(
            name: "xcresulttool",
            targets: ["XCResultToolCLI"]),
        .library(
            name: "XCResultToolKit",
            targets: ["XCResultToolKit"]),
        .library(
            name: "XCResultFormatDescription",
            targets: ["XCResultFormatDescription"]),
        .library(
            name: "XCResultFormatGenerator",
            targets: ["XCResultFormatGenerator"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    
//        .package(url: "https://github.com/apple/swift-syntax.git", .revision("xcode11-beta1")),
//        .package(url: "https://github.com/roman-dzieciol/swift-syntax-util.git", .exact("0.0.2")),
//        .package(url: "https://github.com/roman-dzieciol/sw-lint.git", .exact("0.0.1"))
        .package(path: "../_swift/swift-syntax"),
        .package(path: "../swift-syntax-util"),
        .package(path: "../swift-syntax-dsl"),
        .package(path: "../sw-lint"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "XCResultToolCLI",
            dependencies: ["XCResultToolKit"]),
        .target(
            name: "XCResultFormatDescription",
            dependencies: []),
        .target(
            name: "XCResultFormatGenerator",
            dependencies: ["XCResultToolKit", "SwiftSyntax", "SWLintKit", "SwiftSyntaxUtil", "SwiftSyntaxDSL"]),
        .target(
            name: "XCResultToolKit",
            dependencies: []),
        .testTarget(
            name: "XCResultFormatDescriptionTests",
            dependencies: ["XCResultFormatDescription", "XCResultFormatGenerator", "SwiftSyntax", "SWLintKit", "SwiftSyntaxUtil", "SwiftSyntaxDSL"]),
        .testTarget(
            name: "XCResultFormatGeneratorTests",
            dependencies: ["XCResultFormatGenerator", "SwiftSyntax", "SWLintKit", "SwiftSyntaxUtil", "SwiftSyntaxDSL"]),
        .testTarget(
            name: "XCResultToolKitTests",
            dependencies: ["XCResultToolKit"])
    ],
    swiftLanguageVersions: [.v5]
)
