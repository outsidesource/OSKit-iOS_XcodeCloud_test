//
//  ObservableType+IViewState.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import RxSwift
import RxSwiftExt

public extension ObservableType {
    
    func unwrapDistinct<Result: Equatable>() -> Observable<Result> where Element == Result? {
        
        return self.unwrap()
            .distinctUntilChanged()
        
    }
    
    func distinctViewState<Result: IViewState & Equatable>() -> Observable<IViewState> where Element == Result? {
        
        return self.unwrapDistinct()
            .map { $0 }
        
    }
    
}
