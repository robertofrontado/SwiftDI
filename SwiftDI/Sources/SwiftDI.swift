//
//  SwiftDI.swift
//  SwiftDI
//
//  Created by Roberto Frontado on 30/01/2020.
//  Copyright © 2020 Roberto Frontado. All rights reserved.
//

import Foundation

public class SwiftDI {

    public static let `default` = SwiftDI()
    
    private var dependencies = [String: Resolver]()
    
    public static func configure(container: SwiftDI = .default, _ block: (SwiftDI) -> Void) {
        block(container)
    }
    
    public func single<T>(_ block: () -> T) {
        let key = String(describing: T.self)
        dependencies[key] = Resolver.single(object: block())
    }
    
    public func factory<T>(_ factory: @escaping () -> T) {
        let key = String(describing: T.self)
        dependencies[key] = Resolver.factory(block: factory)
    }
    
    public func resolve<T>() -> T {
        let key = String(describing: T.self)
        print()
        guard let object = dependencies[key]?.resolve() as? T else {
            fatalError("Dependency '\(T.self)' not resolved!")
        }
        
        return object
    }
}
