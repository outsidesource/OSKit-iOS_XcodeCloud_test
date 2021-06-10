//
//  UIDevice+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2018 Outside Source. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    static var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    static var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isTV: Bool {
        return UIDevice.current.userInterfaceIdiom == .tv
    }
    
    static var isCarPlay: Bool {
        return UIDevice.current.userInterfaceIdiom == .carPlay
    }
    
    static var vendorIdentifier: UUID? {
        
        //return self.current.identifierForVendor
        // we are decomposing this due to a bridging error when inlining
        let identifier = self.current.identifierForVendor
        return identifier
        
    }
    
    static var vendorUUIDString: String? {
        return self.vendorIdentifier?.uuidString
    }
    
}
