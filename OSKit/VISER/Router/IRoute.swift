//
//  IRoute.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

// FIXME: REMOVE
public protocol IRoute: IStringIdentifiable { }

extension IRoute {
    
    public var id: String {
        return String(describing: self)
    }
    
}
