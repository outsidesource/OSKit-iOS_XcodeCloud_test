//
//  Result+AsyncState.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

public extension Result {
    
    /// Returns AsyncState representation of Result
    var asyncState: AsyncState<Success, Failure> {
        switch self {
            
        case .success(let element):
            return .complete(element)
        
        case .failure(let error):
            return .error(error)
        }
    }
    
}
