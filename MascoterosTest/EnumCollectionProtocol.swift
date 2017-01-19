//
//  EnumCollectionProtocol.swift
//  MascoterosTest
//
//  Created by Sarah Cleland on 19/01/17.
//  Copyright © 2017 Mascoteros. All rights reserved.
//

import Foundation

protocol EnumCollection: Hashable {
    static var allValues: [Self] { get }
}

extension EnumCollection {
    
    static func cases() -> AnySequence<Self> {
        typealias S = Self
        return AnySequence { () -> AnyIterator<S> in
            var raw = 0
            return AnyIterator {
                let current : Self = withUnsafePointer(to: &raw) { $0.withMemoryRebound(to: S.self, capacity: 1) { $0.pointee } }
                guard current.hashValue == raw else { return nil }
                raw += 1
                return current
            }
        }
    }
    
    static var allValues: [Self] {
        return Array(self.cases())
    }
}
