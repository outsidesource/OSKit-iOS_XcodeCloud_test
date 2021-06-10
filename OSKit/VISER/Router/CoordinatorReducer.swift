//
//  CoordinatorReducer.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

open class CoordinatorReducer<S: ICoordinatorState>: IIdentifiableReducer {
    
    open class func reduce(_ action: IAction, _ state: IIdentifiableState) -> IIdentifiableState {
        
        /// This check is required since our reduce signature is abstract to operate with StateContext
        guard let coordinatorState = state as? S else {
            return state
        }
        
        switch action {
        
        case let action as SingleAction<CoordinatorAction.TriggerRoute, IRoute>:
            return reduceTriggerRouteAction(action, coordinatorState)
            
        default:
            break
            
        }
        
        return coordinatorState
        
    }
    
    private class func reduceTriggerRouteAction(_ action: SingleAction<CoordinatorAction.TriggerRoute, IRoute>, _ state: ICoordinatorState) -> ICoordinatorState {

        var state = state
        //state.triggerRouteAction = action
        
        switch action {
            
        case .success(_, let route):
            
            if let index = state.routes.firstIndex(where: { nextRoute in
                return route.id == nextRoute.id
            }) {
                state.routes.remove(at: index)
            }
            
        default:
            break
        }
        
        return state
        
    }
    
}
