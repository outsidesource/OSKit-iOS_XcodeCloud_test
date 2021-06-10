//
//  IActionDispatching.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

public protocol IActionDispatching {
    var actionDispatcher: IActionDispatcher { get }
}

public extension IActionDispatching {
    
    func dispatch(_ action: IAction) {
        self.actionDispatcher.dispatch(action)
    }
    
}
