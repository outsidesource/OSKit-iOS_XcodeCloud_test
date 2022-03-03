//
//  StateStore.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

//public struct StateStore<S: IState>: IStringIdentifiable {
//    
//    public let id: String
//    
//    // TODO: - 0 CONSIDER injecting namespace or type to augment the id (key)
//    // This will allow multiple types of state to share the same ID
//    
//    private let stateStore: IStateStore
//    
//    public var state: S? {
//        return stateStore.getState(id) as? S
//    }
//    
//    public init(id: String, stateStore: IStateStore) {
//        self.id = id
//        self.stateStore = stateStore
//    }
//    
//}
