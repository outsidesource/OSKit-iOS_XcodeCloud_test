//
//  IStateStoreProvider.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

/// A type the provides a `IStateStore` matching it's own state type
public protocol IStateStoreProvider {
    associatedtype StateStoreType: IStateStore
    var stateStore: StateStoreType { get }
}
