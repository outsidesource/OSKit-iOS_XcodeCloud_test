//
//  SynchronizedConurrentBarrier.swift
//  OSKit
//
//  Created by Brody Robertson on 3/12/22.
//  Copyright © 2022 Outside Source. All rights reserved.
//

struct SynchronizedConcurrentBarrier<Value> {
    
    private var _value: Value
    private let queue = DispatchQueue(label: "com.github.outsidesource.OSKit.SynchronizedBarrier", attributes: .concurrent)
    
    init(_ value: Value) {
        self._value = value
    }
    
    var value: Value {
        return queue.sync {
            return _value
        }
    }
    
    mutating func value<T>(execute task: (inout Value) throws -> T) rethrows -> T {
        return try queue.sync(flags: .barrier) {
            return try task(&_value)
        }
    }
    
}
