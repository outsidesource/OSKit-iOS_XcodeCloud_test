//
//  CombineReSwiftStore.swift
//  OSKit
//
//  Created by Brody Robertson on 7/2/21.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import ReSwift

@available(iOS 13.0, *)
public class CombineReSwiftStore<T: StateType & IState>: CombineStateStore<T> {
    
    let store: Store<T>
    
    public init(store: Store<T>) {
        self.store = store
        super.init(store.state)
        store.subscribe(self)
    }
    
}

@available(iOS 13.0, *)
extension CombineReSwiftStore: StoreSubscriber {
    
    public func newState(state: T) {
        self.state = state
    }
    
}
