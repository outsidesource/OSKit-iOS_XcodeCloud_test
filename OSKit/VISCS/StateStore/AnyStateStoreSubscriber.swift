//
//  AnyStateStoreSubscriber.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

/// A type-erased `IStateStoreSubscriber`
public class AnyStateStoreSubscriber: IStateStoreSubscriber {
    
    private var _didUpdate: (_ state: IState?) -> ()
    
    init(_ subscriber: IStateStoreSubscriber) {
        _didUpdate = { subscriber.didUpdate($0) }
    }
    
    public func didUpdate(_ state: IState?) {
        _didUpdate(state)
    }

}

extension IStateStoreSubscriber {
    
    var anyStateStoreSubscriber: AnyStateStoreSubscriber {
        return AnyStateStoreSubscriber(self)
    }
    
}
