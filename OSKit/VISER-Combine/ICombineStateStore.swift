//
//  ICombineStateStore.swift
//  OSKit
//
//  Created by Brody Robertson on 7/1/21.
//

import Combine

@available(iOS 13.0, *)
public protocol ICombineStateStore {
    func getStatePublisher<S: IState>(_ id: String) -> AnyPublisher<S?, Never>
}
