//
//  StateContainerAction.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

public enum StateContainerAction: IAction {
    case initState(StateContext)
    /// deinit by id
    case deinitState(String)
}
