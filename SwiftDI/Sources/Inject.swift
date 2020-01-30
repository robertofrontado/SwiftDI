//
//  Inject.swift
//  SwiftDI
//
//  Created by Roberto Frontado on 30/01/2020.
//  Copyright © 2020 Roberto Frontado. All rights reserved.
//

import Foundation

@propertyWrapper
public struct Inject<Value> {
    
    private var value: Value?
    
    public var wrappedValue: Value {
        get {
            return value ?? SwiftDI.root.resolve()
        }
        set {
            value = newValue
        }
    }
    
    public init() {}
}
