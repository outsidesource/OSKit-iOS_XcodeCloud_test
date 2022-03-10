//
//  IStateStoreSubscriber.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

/// A type that subscribes to `IStateStore` and is notified when the StateStore mutates its state
public protocol IStateStoreSubscriber: AnyObject {
    
    /// Called after the StateStore reduces (mutates) its state
    /// - parameter state: new state as IState
    func didUpdate(_ state: IState?)
}

/// Box for managing subscriber retention
public class StateStoreSubscriberBox {
    
    let isRetained: Bool
    private weak var _weakSubscriber: IStateStoreSubscriber?
    private var _strongSubscriber: IStateStoreSubscriber?
    
    init(_ subscriber: IStateStoreSubscriber?, isRetained: Bool = false) {
        
        self.isRetained = isRetained
        
        if isRetained {
            self._strongSubscriber = subscriber
        } else {
            self._weakSubscriber = subscriber
        }
        
    }
    
    public var subscriber: IStateStoreSubscriber? {
        return isRetained ? _strongSubscriber : _weakSubscriber
    }
    
}
