//
//  IStateContainer.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

public protocol IStateContainer: IState {
    func getState(_ id: String) -> IState?
}
