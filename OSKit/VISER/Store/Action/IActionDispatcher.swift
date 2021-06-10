//
//  IActionDispatcher.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

public protocol IActionDispatcher {
    func dispatch(_ action: IAction)
}
