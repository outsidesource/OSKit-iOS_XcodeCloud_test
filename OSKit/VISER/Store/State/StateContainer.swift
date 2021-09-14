//
//  StateContainer.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

public struct StateContainer: IStateContainer {
    
    var stateContexts = [String: StateContext]()
    
    public func getState(_ id: String) -> IState? {
        return stateContexts[id]?.state
    }
    
    mutating func addStateContext(_ stateContext: StateContext) {
        stateContexts[stateContext.id] = stateContext
    }
    
    mutating func removeStateContext(_ id: String) {
        stateContexts[id] = nil
    }
    
    public init() {
        
    }
        
}

public struct StateContext: IStringIdentifiable {
    
    public var id: String {
        return state.id
    }
    
    var state: IIdentifiableState
    var reduce: IdentifiableReduce
    
    public init(state: IIdentifiableState, reduce: @escaping IdentifiableReduce) {
        self.state = state
        self.reduce = reduce
    }
    
}
