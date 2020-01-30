//
//  SwiftDI.swift
//  SwiftDI
//
//  Created by Roberto Frontado on 30/01/2020.
//  Copyright © 2020 Roberto Frontado. All rights reserved.
//

import Foundation

public class SwiftDI {
    
    public static var `default` = SwiftDI()
    
    private var factories = [String: () -> Any]()
    
    public static func configure(container: SwiftDI = .default, _ block: (SwiftDI) -> Void) {
        block(container)
    }
    
    public func add<T>(_ factory: @escaping () -> T) {
        let key = String(describing: T.self)
        factories[key] = factory
    }
 
    public func resolve<T>() -> T {
        let key = String(describing: T.self)
        
        guard let component: T = factories[key]?() as? T else {
            fatalError("Dependency '\(T.self)' not resolved!")
        }
        
        return component
    }
}
