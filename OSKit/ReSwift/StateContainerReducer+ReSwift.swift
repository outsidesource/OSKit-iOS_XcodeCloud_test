//
//  StateContainerReducer+ReSwift.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import ReSwift

/// Conform OSKit.StateContainerReducer to ReSwift.Reducer
public extension StateContainerReducer {
 
    /// ReSwift.Reducer injected in Store<StateContainer>
    static func reduce(_ action: Action, _ state: StateContainer?) -> StateContainer {
        
        guard let action = action as? IAction else {
            abort()
        }
        
        return self.reduce(action, state)
        
    }

}
