//
//  OSLog+VISCS.swift
//  OSKit
//
//  Created by Brody Robertson on 4/1/22.
//  Copyright © 2022 Outside Source. All rights reserved.
//

public extension OSLog.Domain {
    
    // VISCS Components
    static let view = OSLog.Domain("view")
    static let interactor = OSLog.Domain("interactor")
    static let service = OSLog.Domain("service")
    static let coordinator = OSLog.Domain("coordinator")
    static let stateStore = OSLog.Domain("stateStore")
    
}
