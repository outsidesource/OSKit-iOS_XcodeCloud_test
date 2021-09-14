//
//  CombineStateStore.swift
//  OSKit
//
//  Created by Brody Robertson on 7/1/21.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import Combine

@available(iOS 13.0, *)
open class CombineStateStore<T: IState> {
    
    @Published var state: T?
    
    public init(_ state: T? = nil) {
        self.state = state
    }
    
}

@available(iOS 13.0, *)
extension CombineStateStore: ICombineStateStore where T: IStateContainer {
    
    public func getStatePublisher<S: IState>(_ id: String) -> AnyPublisher<S?, Never> {
    
        return $state
            .map { stateContainer -> S? in
                return stateContainer?.getState(id) as? S
            }
            .eraseToAnyPublisher()
        
    }
    
}
