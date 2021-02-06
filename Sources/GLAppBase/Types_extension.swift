//
//  Types.swift
//
//  Created by Volodymyr Boichentsov on 29/12/2015.
//
//

import SwiftMath

public extension Vector2f {
    
    init(_ x:Int32, _ y:Int32) {
        self.init(Float(x), Float(y))
    }
    
    init(_ x:Double, _ y:Double) {
        self.init(Float(x), Float(y))
    }
}

