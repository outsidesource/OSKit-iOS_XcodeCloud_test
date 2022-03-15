//
//  ObservableType+OSLog.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2018 Outside Source. All rights reserved.
//

import RxSwift

// TODO: - 1 ADD function signature which accepts domains: [OSLog.Domain]

public extension ObservableType {
    
    func osLog(_ message: String? = nil, domain: OSLog.Domain = .default, _ file: String = #file, _ function: String = #function, _ line: Int = #line) -> Observable<Self.Element> {
        
        let message = message ?? ""
        
        return self
            .do(onNext: {
                OSLog.info("\(message).onNext: \($0)", domain: domain, file, function, line)
            }, onError: {
                OSLog.error("\(message).onError: \($0)", domain: domain, file, function, line)
            }, onCompleted: {
                OSLog.debug("\(message).onCompleted", domain: domain, file, function, line)
            }, onSubscribe: {
                OSLog.debug("\(message).onSubscribe", domain: domain, file, function, line)
            }, onSubscribed: {
                OSLog.debug("\(message).onSubscribed", domain: domain, file, function, line)
            }, onDispose: {
                OSLog.debug("\(message).onDispose", domain: domain, file, function, line)
            })
        
    }
    
}

public extension PrimitiveSequenceType where Trait == SingleTrait {
    
    func osLog(_ message: String? = nil, domain: OSLog.Domain = .default, _ file: String = #file, _ function: String = #function, _ line: Int = #line) -> PrimitiveSequence<Self.Trait, Self.Element> {
        
        let message = message ?? ""
        
        return self
            .do(onSuccess: {
                OSLog.info("\(message).onSuccess: \($0)", domain: domain, file, function, line)
            }, onError: {
                OSLog.error("\(message).onError: \($0)", domain: domain, file, function, line)
            }, onSubscribe: {
                OSLog.debug("\(message).onSubscribe", domain: domain, file, function, line)
            }, onSubscribed: {
                OSLog.debug("\(message).onSubscribed", domain: domain, file, function, line)
            }, onDispose: {
                OSLog.debug("\(message).onDispose", domain: domain, file, function, line)
            })
        
    }
    
}

public extension PrimitiveSequenceType where Trait == MaybeTrait {
    
    func osLog(_ message: String? = nil, domain: OSLog.Domain = .default, _ file: String = #file, _ function: String = #function, _ line: Int = #line) -> PrimitiveSequence<Self.Trait, Self.Element> {
        
        let message = message ?? ""
        
        return self
            .do(onNext: {
                OSLog.info("\(message).onNext: \($0)", domain: domain, file, function, line)
            }, onError: {
                OSLog.error("\(message).onError: \($0)", domain: domain, file, function, line)
            }, onCompleted: {
                OSLog.debug("\(message).onCompleted", domain: domain, file, function, line)
            }, onSubscribe: {
                OSLog.debug("\(message).onSubscribe", domain: domain, file, function, line)
            }, onSubscribed: {
                OSLog.debug("\(message).onSubscribed", domain: domain, file, function, line)
            }, onDispose: {
                OSLog.debug("\(message).onDispose", domain: domain, file, function, line)
            })
        
    }
    
}

public extension PrimitiveSequenceType where Trait == CompletableTrait, Element == Swift.Never {
    
    func osLog(_ message: String? = nil, domain: OSLog.Domain = .default, _ file: String = #file, _ function: String = #function, _ line: Int = #line) -> PrimitiveSequence<Self.Trait, Self.Element> {
        
        let message = message ?? ""
        
        return self
            .do(onError: {
                OSLog.error("\(message).onError: \($0)", domain: domain, file, function, line)
            }, onCompleted: {
                OSLog.info("\(message).onCompleted", domain: domain, file, function, line)
            }, onSubscribe: {
                OSLog.debug("\(message).onSubscribe", domain: domain, file, function, line)
            }, onSubscribed: {
                OSLog.debug("\(message).onSubscribed", domain: domain, file, function, line)
            }, onDispose: {
                OSLog.debug("\(message).onDispose", domain: domain, file, function, line)
            })
        
    }
    
}

// TODO: - 0 EXTRACT to Log+RxCocoa
import RxCocoa

extension SharedSequenceConvertibleType {
    
    public func osLog(_ message: String? = nil, domain: OSLog.Domain = .default, _ file: String = #file, _ function: String = #function, _ line: Int = #line) -> SharedSequence<SharingStrategy, Element> {
        
        let message = message ?? ""
        
        return self
            .do(onNext: {
                OSLog.info("\(message).onNext: \($0)", domain: domain, file, function, line)
            }, onCompleted: {
                OSLog.debug("\(message).onCompleted", domain: domain, file, function, line)
            }, onSubscribe: {
                OSLog.debug("\(message).onSubscribe", domain: domain, file, function, line)
            }, onSubscribed: {
                OSLog.debug("\(message).onSubscribed", domain: domain, file, function, line)
            }, onDispose: {
                OSLog.debug("\(message).onDispose", domain: domain, file, function, line)
            })
        
    }
    
}
