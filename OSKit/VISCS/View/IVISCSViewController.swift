//
//  IVISCSViewController.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2022 Outside Source. All rights reserved.
//

public protocol IVISCSViewController {
    associatedtype StateType
    associatedtype StateStoreType: IStateStore where StateStoreType.StateType == StateType
    var stateStore: StateStoreType? { get }
    var viewDelegate: IViewDelegate? { get }
}
