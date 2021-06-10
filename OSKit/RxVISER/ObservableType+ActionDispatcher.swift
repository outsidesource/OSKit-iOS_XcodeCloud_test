//
//  ObservableType+ActionDispatcher.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import RxSwift

public extension PrimitiveSequenceType where Trait == SingleTrait {
    
    func doDispatchRxAction<T: IAction>(_ actionDispatcher: IActionDispatcher, _ action: T) -> PrimitiveSequence<Self.Trait, Self.Element> {
        
        return self.do(onSuccess: { element in
            actionDispatcher.dispatch(SingleAction<T, Element>.success(action, element))
        }, onError: { (error) in
            actionDispatcher.dispatch(SingleAction<T, Element>.error(action, error))
        }, onSubscribed: {
            actionDispatcher.dispatch(SingleAction<T, Element>.subscribed(action))
        }, onDispose: {
            actionDispatcher.dispatch(SingleAction<T, Element>.disposed(action))
        })
        
    }
    
}

public extension ObservableType {
    
    func doDispatchRxAction<T: IAction>(_ actionDispatcher: IActionDispatcher, _ action: T) -> Observable<Self.Element> {
        
        return self.do(onNext: { element in
            actionDispatcher.dispatch(ObservableAction<T, Element>.next(action, element))
        }, onError: { (error) in
            actionDispatcher.dispatch(ObservableAction<T, Element>.error(action, error))
        }, onCompleted: {
            actionDispatcher.dispatch(ObservableAction<T, Element>.complete(action))
        }, onSubscribe: {
            actionDispatcher.dispatch(ObservableAction<T, Element>.subscribe(action))
        }, onSubscribed: {
            actionDispatcher.dispatch(ObservableAction<T, Element>.subscribed(action))
        }, onDispose: {
            actionDispatcher.dispatch(ObservableAction<T, Element>.disposed(action))
        })
        
    }
    
}
