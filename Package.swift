// swift-tools-version:5.5
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
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/SwiftGFX/SwiftMath", from: "3.3.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "GLApplication",
            dependencies: [ "SwiftMath" ],
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

#if os(Windows)

package.targets += [
    .systemLibrary(name: "WinGL"),
]
package.dependencies += [ .package(url: "https://github.com/compnerd/swift-win32", branch: "main") ]
package.targets[0].dependencies += [ "WinGL", .product(name: "SwiftWin32", package: "swift-win32") ]

#endif