// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GLApplication",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "GLApplication",
            targets: ["GLApplication"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "SGLMath", url: "https://github.com/SwiftGL/Math.git", from: "3.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "GLApplication",
            dependencies: [ "SGLMath" ],
            cSettings: [.define("GL_GLEXT_PROTOTYPES")]),
        .testTarget(
            name: "GLApplicationTests",
            dependencies: ["GLApplication"]),
    ]
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
