//
//  OSSemanticVersion.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

// TODO: 2 CONSIDER adding RawRepresentable conformance
public struct OSSemanticVersion: Codable, Equatable {
    
    public let major: UInt
    public let minor: UInt
    public let patch: UInt
    
    public init(major: UInt, minor: UInt, patch: UInt) {
        
        self.major = major
        self.minor = minor
        self.patch = patch
        
    }
    
    public init?(raw: String) {
        
        let components = raw.components(separatedBy: ".")
        
        guard components.isNotEmpty else {
            return nil
        }
        
        var results: [UInt] = [0, 0, 0]
        
        for i in 0..<min(components.count, results.count) {
            
            guard let component = UInt(components[i]) else {
                /// If any component cannot be cast to UInt we will fail init
                return nil
            }
            
            results[i] = component
            
        }
        
        self.init(major: results[0], minor: results[1], patch: results[2])
        
    }
    
}

extension OSSemanticVersion: CustomStringConvertible {
    
    public var description: String {
        return "\(self.major).\(self.minor).\(self.patch)"
    }
    
}

extension OSSemanticVersion: Comparable {
    
    public static func < (lhs: OSSemanticVersion, rhs: OSSemanticVersion) -> Bool {
        
        if lhs.major < rhs.major {
            return true
        }
        
        if lhs.major > rhs.major {
            return false
        }
        
        if lhs.minor < rhs.minor {
            return true
        }
        
        if lhs.minor > rhs.minor {
            return false
        }
        
        if lhs.patch < rhs.patch {
            return true
        }
        
        if lhs.patch > rhs.patch {
            return false
        }
        
        return false
        
    }
    
}
