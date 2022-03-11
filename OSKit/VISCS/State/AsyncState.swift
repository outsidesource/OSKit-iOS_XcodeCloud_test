//
//  AsyncState.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

/// Describes the state of an Async operation
public enum AsyncState<ElementType, ErrorType: Error>: IState {
    
    /// Case when Async operation has been deinit
    ///
    /// - NOTE: Analagous to RxSwift onSubscribe
    case idle
    
    /// Case when Async operation has been deinit
    ///
    /// - NOTE: Analagous to RxSwift onDispose
    case cancelled

    /// Case when Async operation is busy / executing
    ///
    /// - NOTE: Analagous to RxSwift onSubscribed
    case busy
    
    /// Case when Async operation emits and element but is still executing
    ///
    /// - NOTE: Analagous to RxSwift onNext
    case element(ElementType)
    
    /// Case when Async operation is complete with or without an element
    ///
    /// - NOTE: Analagous to RxSwift onComplete & onSuccess
    case complete(ElementType? = nil)
    
    /// Case when Async operation completes with an error
    ///
    /// - NOTE: Analagous to RxSwift onError
    case error(Error)
    
    /// Returns true if the Async operation is busy - not in a completion or idle state
    public var isBusy: Bool {
        
        switch self {
        case .busy, .element:
            return true
        default:
            return false
        }
    }
    
}
