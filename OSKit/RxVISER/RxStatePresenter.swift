//
//  RxStatePresenter.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import RxSwift

public struct RxStatePresenter<S: IState>: IStringIdentifiable {
    
    public let id: String
    
    private let stateStore: IRxStateStore
    
    public lazy var state: Observable<S?> = {
        return stateStore.getStateObservable(id)
            .map {
                $0 as? S
            }
    }()
    
    public init(id: String, stateStore: IRxStateStore) {
        self.id = id
        self.stateStore = stateStore
    }
    
}
