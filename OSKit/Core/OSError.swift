//
//  OSError.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//


public struct OSError: Error {
    
    public let error: Error
    
    /// Date is set on construction and allows us to further differentiate errors of the same type
    public let date: Date
    
    public init(_ error: Error) {
        self.error = error
        self.date = Date()
    }
    
}

extension OSError: LocalizedError {
    
    public var errorDescription: String? {
        return error.localizedDescription
    }
    
}

extension OSError: Equatable {
    
    /// Use simple comparison of error localizedDescription for basic equality check
    public static func == (lhs: OSError, rhs: OSError) -> Bool {
        return lhs.error.localizedDescription == rhs.error.localizedDescription && lhs.date == rhs.date
    }
    
}
