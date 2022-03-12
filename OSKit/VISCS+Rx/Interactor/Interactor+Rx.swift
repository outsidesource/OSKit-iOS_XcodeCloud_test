//
//  Interactor+rx.swift
//  OSKit
//
//  Created by Brody Robertson on 3/3/22.
//

public extension Interactor {
    
    var rx: StateStore<StateType>.Reactive<StateType> {
        return stateStore.rx
    }
    
}
