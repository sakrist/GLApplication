// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let shouldBuildForEmbedded =
    Context.environment["JAVASCRIPTKIT_EXPERIMENTAL_EMBEDDED_WASM"].flatMap(Bool.init) ?? false


let swiftSettings: [SwiftSetting] = shouldBuildForEmbedded ? [
                .enableExperimentalFeature("Embedded"),
                .define("NOSIMD"),
                .unsafeFlags([
                    "-Xfrontend", "-emit-empty-object-file",
                ]),
            ] : []

let cSettings: [CSetting] = shouldBuildForEmbedded ? [ .unsafeFlags(["-fdeclspec"]) ] : []

let dependencies: [Package.Dependency] = shouldBuildForEmbedded ? [
    .package(path: "../emswiften"),
    .package(url: "https://github.com/swiftwasm/swift-dlmalloc", from: "0.1.0"),
    .package(url: "https://github.com/swiftwasm/JavaScriptKit", branch: "main"),] : []

let targetDependencies: [Target.Dependency] = shouldBuildForEmbedded ? [
    "emswiften", "JavaScriptKit", .product(name: "dlmalloc", package: "swift-dlmalloc")] : []


let package = Package(
    name: "GLApplication",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "GLApplication",
            targets: ["GLApplication"]),
    ],
    dependencies: dependencies + [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(path: "../SwiftMath")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "GLApplication",
            dependencies: targetDependencies + [ "SwiftMath" ],
            cSettings: [.define("GL_GLEXT_PROTOTYPES")] + cSettings,
            swiftSettings: swiftSettings),
        .testTarget(
            name: "GLApplicationTests",
            dependencies: ["GLApplication"]),
    ],
    swiftLanguageModes: [.v5]
)

#if os(Android) || os(Linux)
package.targets[0].swiftSettings = [.define("NOSIMD")]
#endif

#if os(Linux)

package.targets += [
    .systemLibrary(name: "X11",
                   pkgConfig: "x11",
                   providers: [.apt(["libx11-dev"])]),
    .systemLibrary(name: "OpenGL",
                   pkgConfig: "gl",
                   providers: [.apt(["libglu1-mesa-dev", "mesa-common-dev"])]),
]

package.targets[0].dependencies += [ "OpenGL", "X11" ]

#endif
