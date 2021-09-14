//
//  CombineStatePresenter.swift
//  OSKit
//
//  Created by Brody Robertson on 7/1/21.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import Combine

@available(iOS 13.0, *)
public class CombineStatePresenter<S: IState>: IStringIdentifiable, ObservableObject {
    
    public let id: String
    
    @Published public var state: S?
    
    private let stateStore: ICombineStateStore
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var statePublisher: AnyPublisher<S?, Never> = {
        
        return stateStore.getStatePublisher(id)

    }()
        
    public init(id: String, stateStore: ICombineStateStore) {
        
        self.id = id
        self.stateStore = stateStore
        
        self.statePublisher
            .assign(to: \.state, on: self)
            .store(in: &cancellables)
        
    }
    
}
