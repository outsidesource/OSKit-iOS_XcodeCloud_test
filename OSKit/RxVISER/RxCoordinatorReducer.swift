//
//  RxCoordinatorReducer.swift
//  OSKit
//
//  Created by Brody Robertson on 9/7/21.
//  Copyright © 2021 Outside Source. All rights reserved.
//

open class RxCoordinatorReducer: CoordinatorReducer {
    
    override open class func reduce(_ action: IAction, _ state: IIdentifiableState) -> IIdentifiableState {
        
        let state = super.reduce(action, state)
        
        guard let coordinatorState = state as? ICoordinatorState else {
            return state
        }
        
        switch action {
        
        case let action as SingleAction<CoordinatorAction.TriggerRoute, IRoute>:
            return reduceRxTriggerRouteAction(action, coordinatorState)
            
        default:
            break
            
        }
        
        return coordinatorState
        
    }
    
    private class func reduceRxTriggerRouteAction(_ action: SingleAction<CoordinatorAction.TriggerRoute, IRoute>, _ state: ICoordinatorState) -> ICoordinatorState {

        var state = state
        
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
