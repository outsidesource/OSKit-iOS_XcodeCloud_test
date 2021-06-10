//
//  IIdentifiableReducer.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

public typealias IdentifiableReduce = (_ action: IAction, _ state: IIdentifiableState) -> IIdentifiableState

public protocol IIdentifiableReducer {
    static func reduce(_ action: IAction, _ state: IIdentifiableState) -> IIdentifiableState
}
