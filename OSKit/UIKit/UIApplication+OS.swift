//
//  UIApplication+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import UIKit

public extension UIApplication {
    
    static var state: UIApplication.State {
        return self.shared.applicationState
    }
    
    static var isActive: Bool {
        return self.state == .active
    }
    
    static var isBackground: Bool {
        return self.state == .background
    }
 
    static func openAppSettings() {
        
        guard let url = URL(string: self.openSettingsURLString) else {
            return
        }
        
        self.open(url)
        
    }
    
    static func openSettings() {
         
        guard let url = URL(string: "App-prefs:") else {
            return
        }
        
        self.open(url)
        
    }
    
    /// This would likely get rejected by app review
//    static func openBluetoothSettings() {
//
//        guard let url = URL(string: "App-prefs:root=Bluetooth") else {
//            return
//        }
//
//        self.shared.open(url)
//
//    }
    
    static func open(_ url: URL) {
        self.shared.open(url)
    }
    
}
    
