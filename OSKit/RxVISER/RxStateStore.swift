//
//  RxStateStore.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import RxSwift
import RxCocoa

open class RxStateStore<T: IState> {
    
    public let _stateRelay = BehaviorRelay<T?>(value: nil)
    public let state: Observable<T?>
    
    public init(_ state: T? = nil) {
        
        self.state = _stateRelay
            .asObservable()
            /// prevent Rx re-entrancy anomalies
            .observeOn(MainScheduler.asyncInstance)
        
        _stateRelay.accept(state)
        
    }
    
}

extension RxStateStore: IRxStateStore where T: IStateContainer {
    public func getStateObservable(_ id: String) -> Observable<IState?> {
        return self.state
            .map { stateContainer in
                stateContainer?.getState(id)
            }
    }
}
