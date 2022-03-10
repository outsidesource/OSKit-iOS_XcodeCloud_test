//
//  StateStore.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

/// A generic class implementing `IStateStore`
public class StateStore<StateType: IState>: IStateStore {
    
    deinit {
        OSLog.info(StateType.self)
    }
    
    private var _subscribers: [StateStoreSubscriberBox] = []
    
    /// Returns the current state
    public private(set) var state: StateType?
    
    /// Updates state with reduced state and notifies subscribers of state updates
    /// - parameter reducer: function which receives current state and returns new state
    public func reduceState(reducer: (StateType?)->StateType?) {
        state = reducer(state)
        self._didUpdate(state)
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
        
        // TODO: ADD evaluation of current subscribers to prevent duplicate subscription
        
        let box = StateStoreSubscriberBox(subscriber, isRetained: isRetained)
        _addSubscriberBox(box)
        
    }
    
    // TODO: - 0 ADD removeSubscriber
    
    private func _addSubscriberBox(_ box: StateStoreSubscriberBox) {
        _subscribers.append(box)
    }
    
}
