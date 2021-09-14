//
//  ICombineStateStore.swift
//  OSKit
//
//  Created by Brody Robertson on 7/1/21.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import Combine

@available(iOS 13.0, *)
public protocol ICombineStateStore {
    func getStatePublisher<S: IState>(_ id: String) -> AnyPublisher<S?, Never>
}
