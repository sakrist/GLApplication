//
//  Types.swift
//
//  Created by Volodymyr Boichentsov on 29/12/2015.
//
//

import SGLMath

public extension vec2 {
    
    init(_ x:Int32, _ y:Int32) {
        self.init(Float(x), Float(y))
    }
    
    init(_ x:Double, _ y:Double) {
        self.init(Float(x), Float(y))
    }
}

public class Size {
    public var width:Int
    public var height:Int
    public init(_ w:Int, _ h:Int) {
        width = w
        height = h
    }
    
    public convenience init(_ x:Int32, _ y:Int32) {
        self.init(Int(x), Int(y))
    }
    
    public convenience init(_ x:Double, _ y:Double) {
        self.init(Int(x), Int(y))
    }
    
    public convenience init(_ x:Float, _ y:Float) {
        self.init(Int(x), Int(y))
    }
}

public typealias Point = vec2
