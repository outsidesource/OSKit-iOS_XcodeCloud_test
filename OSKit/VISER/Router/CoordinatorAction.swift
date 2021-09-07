//
//  CoordinatorAction.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

public enum CoordinatorAction: IAction {
    
    public struct TriggerRoute: IIdentifiableAction {
        
        public let id: String
        
        /// Route is optional due to compatibility where TriggerRoute is wrapped in an async action and the Element is IRoute
        public let route: IRoute?
        
        public init(id: String, route: IRoute? = nil) {
            self.id = id
            self.route = route
        }
        
    }
    
}
