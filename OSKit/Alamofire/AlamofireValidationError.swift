//
//  AlamofireValidationError.swift
//  OSKit
//
//  Created by Theja Sengodan on 12/3/20.
//  Copyright © 2020 Outside Source. All rights reserved.
//

public enum AlamofireValidationError: Error {
    
    case validationError(error: Error)
    case invalidData
    
}

extension AlamofireValidationError: LocalizedError {
    
    public var errorDescription: String? {
        
        switch self {
            
        case .invalidData:
            return NSLocalizedString("AlamofireValidationError.invalidData", comment: "")
            
        case .validationError(let error):
            
            let stringFormat = NSLocalizedString("AlamofireValidationError.validationError", comment: "")
            return String.localizedStringWithFormat(stringFormat, error.localizedDescription)
            
        }
    }
}
