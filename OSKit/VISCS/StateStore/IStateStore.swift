//
//  IStateStore.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

/// A type which exposes state and manages mutation of state via a pure reducer
public protocol IStateStore {
    associatedtype StateType: IState
    var state: StateType? { get }
    func reduceState(reducer: (StateType?)->StateType?)
    var subscribers: [IStateStoreSubscriber] { get }
    func addSubscriber(_ subscriber: IStateStoreSubscriber, isRetained: Bool)
}
