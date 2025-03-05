//
//  Application_Android.swift
//
//  Created by Volodymyr Boichentsov on 01/03/2025.
//
//

#if canImport(JavaScriptKit)

import SwiftMath
import JavaScriptKit

open class Application {

    var canvas: JSObject?
    public var renderObject: RenderObject?
    
    public init(canvas: JSObject) {
        self.canvas = canvas 
        self.applicationCreate()
    }
    
    open func run() { 

        // glClear(GLbitfield(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT))
        // glClearColor(0.65, 0.65, 0.65, 1.0)

    }
    
    open func applicationCreate() {

    }
    open func applicationClose() {}
    
    open func needsDisplay() {
        if renderObject != nil {
            renderObject?.render()
        }
    }

    open func windowDidResize(_ size:Size) {}
    
    // MouseEventDelegate
    
    open func mouseDown(_ point:Point, button:Int) {}
    open func mouseMove(_ point:Point) {}
    open func mouseUp(_ point:Point) {}
    
}
    
#endif

