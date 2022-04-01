//
//  UIViewTag.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

/// Type that used interchangable with Int for UIVIew.tag to allow access to enum like values
public typealias UIViewTag = Int

public extension UIViewTag {
    
    static let `static`: UIViewTag = Int.max
    static let transient: UIViewTag = Int.max - 1
        
}
