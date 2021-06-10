//
//  OSTuple.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

struct OSTuple<T> {
    
    let original: T
    private let array: [Mirror.Child]
    
    init(_ value: T) {
        self.original = value
        array = Array(Mirror(reflecting: original).children)
    }
    
    func forEach(closure: (Mirror.Child) -> ()) {
        array.forEach { closure($0) }
    }
    
    func getOnlyValues<T: Any>() -> [T] {
        array.compactMap { $0.value as? T }
    }
    
    func getAllValues() -> [Any] {
        array.compactMap { $0.value }
    }
    
}
