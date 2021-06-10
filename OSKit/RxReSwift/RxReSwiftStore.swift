//
//  RxReSwiftStore.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import ReSwift
import RxSwift

// TODO: - 2 CONSIDER an RxCocoa approach to creating an Rx extension to ReSwift.Store
public class RxReSwiftStore<T: StateType & IState>: RxStateStore<T> {
    
    let store: Store<T>
    
    public init(store: Store<T>) {
        self.store = store
        super.init(store.state)
        store.subscribe(self)
    }
    
}

extension RxReSwiftStore: StoreSubscriber {
    
    public func newState(state: T) {
        self._stateRelay.accept(state)
    }
    
}
