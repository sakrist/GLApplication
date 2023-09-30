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

open class Application: ApplicationDelegate, SceneDelegate, AppDelegate {
    public var renderObject: RenderObject?
    var window: Window?

     public required init() {

     }

    public func application(_ application: SwiftWin32.Application,
                          didFinishLaunchingWithOptions options: [SwiftWin32.Application.LaunchOptionsKey:Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = SwiftWin32.Window(frame: Rect( x:100, y:100, width:600, height:400));

        window?.rootViewController = ViewController()
        window?.rootViewController?.title = "App"
        window?.makeKeyAndVisible()
        self.applicationCreate()
        return true
    }

    open func run() { }

    public func applicationWillTerminate(_ application: SwiftWin32.Application) {
        self.applicationClose()
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