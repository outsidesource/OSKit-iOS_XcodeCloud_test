//
//  IStateStoreProvider.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

import OSKit

/// A type the provides a `IStateStore` matching it's own state type
public protocol IStateStoreProvider {
    associatedtype StateType
    associatedtype StateStoreType: IStateStore where StateStoreType.StateType == StateType
    var stateStore: StateStoreType { get }
}
