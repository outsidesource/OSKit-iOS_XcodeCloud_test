//
//  ObservableType+IViewState.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import RxSwift
import RxSwiftExt

// TODO: - 0 EXTRACT to ObservableType+OS
public extension ObservableType where Element: Equatable {
    
    func unwrapDistinctUntilChanged<Result>() -> Observable<Result> where Element == Result? {
        return self.unwrap().distinctUntilChanged()
    }
    
}
