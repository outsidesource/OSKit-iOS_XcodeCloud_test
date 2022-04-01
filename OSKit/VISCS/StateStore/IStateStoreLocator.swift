//
//  IStateStoreLocator.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

/// A service locator type that locates an `IStateStore`
public protocol IStateStoreLocator {
    associatedtype StateStoreType: IStateStore
    var stateStore: StateStoreType { get }
}

