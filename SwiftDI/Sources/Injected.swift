//
//  Injected.swift
//  SwiftDI
//
//  Created by Roberto Frontado on 30/01/2020.
//  Copyright © 2020 Roberto Frontado. All rights reserved.
//

import Foundation

@propertyWrapper
public struct Injected<Value> {
    
    private var value: Value?
    
    public var wrappedValue: Value {
        get {
            return value ?? SwiftDI.default.resolve() // TODO: Support multiple containers
        }
        set {
            value = newValue
        }
    }
    
    public init() {}
}
