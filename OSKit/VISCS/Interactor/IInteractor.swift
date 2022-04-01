//
//  IInteractor.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

/// A type that composes and exposes an `IStateStore`
public protocol IInteractor: AnyObject, IStateStoreLocator, IStateStore { }
