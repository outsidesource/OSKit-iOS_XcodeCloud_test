//
//  StateContainerReducer.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//


public struct StateContainerReducer: IReducer {
    
    public static func reduce(_ action: IAction, _ state: IState) -> IState {
        
        guard let stateContainer = state as? StateContainer else {
            return state
        }
        
        return reduce(action, stateContainer)
        
    }

    public static func reduce(_ action: IAction, _ state: StateContainer?) -> StateContainer {
        
        guard let state = state else {
            /// StateContainer must be initialized on Store construction
            abort()
        }
        
        switch action {
            
        case let action as StateContainerAction:
            return self.reduceStateContainerAction(action, state)
            
        case let action as IIdentifiableAction:
            return self.reduceIdentifiableAction(action, state)
            
        default:
            return self.reduceAnonymousAction(action, state)
            
        }
        
    }
        
    private static func reduceStateContainerAction(_ action: StateContainerAction, _ state: StateContainer) -> StateContainer {
        
        var state = state
        
        switch action {
            
        case .initState(let stateContext):
            state.addStateContext(stateContext)
            
        case .deinitState(let id):
            state.removeStateContext(id)
                    
        }
        
        return state
        
    }
    
    private static func reduceIdentifiableAction(_ action: IIdentifiableAction, _ state: StateContainer) -> StateContainer {
        
        var state = state
        
        guard var stateContext = state.stateContexts[action.id] else {
            /// stateContainer does not contain a stateContext matching the action id so we will not mutate state
            // TODO: - 2 CONSIDER defaulting to reduceAnonymousAction
            return state
        }
        
        /// Mutate the identified stateContext
        stateContext.state = stateContext.reduce(action, stateContext.state)
        state.stateContexts[action.id] = stateContext
        
        return state
        
    }
    
    private static func reduceAnonymousAction(_ action: IAction, _ state: StateContainer) -> StateContainer {
        
        var state = state
        
        /// Mutate all stateContexts with anonymous action
        for (id, stateContext) in state.stateContexts {
            
            var stateContext = stateContext
            stateContext.state = stateContext.reduce(action, stateContext.state)
            state.stateContexts[id] = stateContext
            
        }
        
        return state
        
    }
    
}
