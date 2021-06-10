//
//  OSVersion.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

public struct OSVersion: Codable, Equatable {
    
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public var semanticVersion: OSSemanticVersion? {
        return OSSemanticVersion(raw: self.rawValue)
    }
    
}

extension OSVersion: CustomStringConvertible {
    
    public var description: String {
        return self.rawValue
    }
    
}
