//
//  StateStore+IStateStoreSubscriber.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

extension StateStore: IStateStoreSubscriber {
    
    /// Default behavior when a StateStore subscribes to another StateStore
    public func didUpdate(_ state: IState?) {
        // Notify subscribers with current state of this StateStore
        _didUpdate(self.state)
    }
    
}
