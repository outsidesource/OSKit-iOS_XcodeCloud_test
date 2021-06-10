//
//  IndexPath+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

public extension IndexPath {
    
    var tag: Int {
        let tag = (self.section << 16) | self.row
        return tag
    }
    
}
