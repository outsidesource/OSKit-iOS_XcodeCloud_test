//
//  StateStore.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

// TODO: - 0 CONSIDER the use of Actors
// This would require targeting >=iOS13?

/// A generic class implementing `IStateStore`
public class StateStore<StateType: IState>: IStateStore {
    
    deinit {
        OSLog.info(StateType.self)
    }
    
    private var _subscribers: [StateStoreSubscriberBox] = []
    private var _state: SynchronizedConcurrentBarrier<StateType?> = .init(nil)
    
    /// Returns the current state
    public var state: StateType? {
        return _state.value
    }
    
    /// Updates state with reduced state and notifies subscribers of state updates
    /// - parameter reducer: function which receives current state and returns new state
    public func reduceState(reducer: (StateType?)->StateType?) {
        
        // Mutate state in SynchronizedConcurrentBarrier
        _state.value {
            $0 = reducer($0)
        }
        
        // Notify subscribers on main thread
        DispatchQueue.main.async {
            self._didUpdate(self.state)
        }
        
    }
    
    /// Notifies each subscriber of state update
    func _didUpdate(_ state: StateType?) {
        
        subscribers.forEach {
            $0.didUpdate(state)
        }
        
    }
    
    public var subscribers: [IStateStoreSubscriber] {
        return _subscribers.compactMap { $0.subscriber }
    }
    
    public func addSubscriber(_ subscriber: IStateStoreSubscriber, isRetained: Bool = false) {
        
        // TODO: - 0 ADD evaluation of current subscribers to prevent duplicate subscription
        
        let box = StateStoreSubscriberBox(subscriber, isRetained: isRetained)
        _addSubscriberBox(box)
        
    }
    
    // TODO: - 0 ADD removeSubscriber
    
    private func _addSubscriberBox(_ box: StateStoreSubscriberBox) {
        _subscribers.append(box)
    }
    
}

// TODO: - 0 EXTRACT to /Dispatch?
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
