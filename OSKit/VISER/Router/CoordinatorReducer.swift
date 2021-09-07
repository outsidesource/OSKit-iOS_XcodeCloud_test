//
//  CoordinatorReducer.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

open class CoordinatorReducer: IIdentifiableReducer {
    
    open class func reduce(_ action: IAction, _ state: IIdentifiableState) -> IIdentifiableState {
        
        guard let coordinatorState = state as? ICoordinatorState else {
            return state
        }
        
        switch action {
            
        case let action as CoordinatorAction.TriggerRoute:
            return reduceTriggerRouteAction(action, coordinatorState)
            
        default:
            break
            
        }
        
        return coordinatorState
        
    }
    
    private class func reduceTriggerRouteAction(_ action: CoordinatorAction.TriggerRoute, _ state: ICoordinatorState) -> ICoordinatorState {
        
        var state = state
        if let index = state.routes.firstIndex(where: { nextRoute in
            return action.route?.id == nextRoute.id
        }) {
            state.routes.remove(at: index)
        }
        
        return state
        
    }
    
}
