//
//  Bundle+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2018 Outside Source. All rights reserved.
//


public extension Bundle {
    
    static var version: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    static var buildVersion: String? {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }
    
    static var versionDescription: String? {
        
        guard let version = version, let buildVersion = buildVersion else {
            return nil
        }
        
        return "\(version) (\(buildVersion))"
        
    }
    
}
