//
//  IReducer.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

public typealias Reduce = (_ action: IAction, _ state: IState) -> IState

/// Currently unused
public protocol IReducer {

    // TODO: 1 - IMPROVE IReducer to be generic in nature
    /// We are using this broad signature for reducer due to our intended use of StateContainer as root Store<StateType> and associated type / self limitations
    /// We have explored various approaches and type erasure without success
    
    static func reduce(_ action: IAction, _ state: IState) -> IState
    
    /// Attempt at associated types
//    associatedtype S: IState
//    static func reduce(_ action: IAction, _ state: S) -> S

    /// Attempt at generic func
//    static func reduce<S: IState>(_ action: IAction, _ state: S) -> S
    
}
