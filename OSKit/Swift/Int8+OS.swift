//
//  Int8+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

public extension Int8 {
    
    var toUInt8: UInt8 {
        return UInt8(bitPattern: self)
    }
    
}

public extension Int16 {
    
    var toUInt16: UInt16 {
        return UInt16(bitPattern: self)
    }
    
}
