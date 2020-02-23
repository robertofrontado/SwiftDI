//
//  Resolver.swift
//  SwiftDI
//
//  Created by Roberto Frontado on 23/02/2020.
//  Copyright © 2020 Roberto Frontado. All rights reserved.
//

internal enum Resolver {
    case single(object: Any)
    case factory(block: () -> Any)
    
    func resolve() -> Any {
        switch self {
        case .single(let object): return object
        case .factory(let block): return block()
        }
    }
}
