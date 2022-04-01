//
//  Interactor.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

/// A generic class implementing `IInteractor`
open class Interactor<StateType: IState>: IInteractor {
        
    public let stateStore = StateStore<StateType>()
    
    public init(state: StateType? = nil) {

        reduceState { _ in
            /// Reduce state to injected state
            return state
        }

    }
    
}

