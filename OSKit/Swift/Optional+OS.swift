//
//  Optional+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

public extension Optional {
    
    var isNil: Bool {
        
        guard case Optional.none = self else {
            return false
        }

        return true
        
    }
    
    var isSome: Bool {

        return !self.isNil
                
    }
    
}
