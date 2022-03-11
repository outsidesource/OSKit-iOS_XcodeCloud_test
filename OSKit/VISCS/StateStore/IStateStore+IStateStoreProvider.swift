//
//  IStateStore+IStateStoreProvider.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

public extension IStateStore where Self: IStateStoreProvider, StateStoreType.StateType == StateType {
    
    var state: StateType? {
        stateStore.state
    }
    
    func reduceState(reducer: (StateType?)->StateType?) {
        stateStore.reduceState(reducer: reducer)
    }
    
    var subscribers: [IStateStoreSubscriber] {
        return stateStore.subscribers
    }
    
    func addSubscriber(_ subscriber: IStateStoreSubscriber, isRetained: Bool = false) {
        stateStore.addSubscriber(subscriber, isRetained: isRetained)
    }
    
}
