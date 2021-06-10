//
//  Int+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//


public extension Int {
    
    var indexPath: IndexPath {
        let section = self >> 16
        let row = self & 0xFFFF
        return IndexPath(row: row, section: section)
    }
    
}
