//
//  Application_Windows.swift
//
//  Created by Volodymyr Boichentsov on 30/09/2023.
//

#if os(Windows)
import Foundation
import SwiftWin32
import Win.GL
import SwiftMath

open class Application: ApplicationDelegate, SceneDelegate {
    public var renderObject: RenderObject?
    var window: Window?

    public required init() { }
    
    public func scene(_ scene: Scene, willConnectTo session: SceneSession,
             options: Scene.ConnectionOptions) {
        guard let windowScene = scene as? WindowScene else { return }

        // Set the preferred window size and restrict resizing by setting the
        // minimum and maximum to the same value.
        let size = SwiftWin32.Size(width: 265, height: 530)
        windowScene.sizeRestrictions?.minimumSize = size
        windowScene.sizeRestrictions?.maximumSize = size

        self.window = Window(windowScene: windowScene)

        window?.rootViewController = ViewController()
        window?.rootViewController?.title = "App"

        applicationCreate()
    }

    open func run() { }

    public func sceneDidBecomeActive(_: Scene) {
        
    }

    public func sceneWillResignActive(_: Scene) {
        
    }

    func applicationWillTerminate(_: Application) {
        applicationClose()
    }
    
    open func applicationCreate() {}
    open func applicationClose() {}
    
    open func needsDisplay() {
        if renderObject != nil {
            renderObject?.render()
        }
    }

    open func windowDidResize(_ size:SwiftMath.Size) {}
    
    // MouseEventDelegate
    
    open func mouseDown(_ point:SwiftMath.Point, button:Int) {}
    open func mouseMove(_ point:SwiftMath.Point) {}
    open func mouseUp(_ point:SwiftMath.Point) {}
    
}
#endif