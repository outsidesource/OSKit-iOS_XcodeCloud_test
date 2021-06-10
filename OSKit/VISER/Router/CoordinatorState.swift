//
//  CoordinatorState.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

public protocol ICoordinatorState: IIdentifiableState {
    var routes: [IRoute] { get set }
    //var triggerRouteAction: SingleAction<CoordinatorAction.TriggerRoute, IRoute>? { get }
}

/// A reusuable concerte ICoordinatorState
/// CoordinatorState should compose common semantics of coordinators and should generally be used by all coordinators
/// Actual view hierarchy state is ownged by the rootViewController
public struct CoordinatorState: ICoordinatorState {
    
    public let id: String
    public var routes: [IRoute] = []
    //public var triggerRouteAction: SingleAction<CoordinatorAction.TriggerRoute, IRoute>?
    
    public init(_ id: String = UUID().uuidString) {
        self.id = id
    }
    
}
