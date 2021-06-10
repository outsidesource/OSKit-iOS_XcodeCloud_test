//
//  UUID+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

public extension UUID {
    
    var data: Data {
        return withUnsafeBytes(of: self.uuid, { Data($0) })
    }
    
}
