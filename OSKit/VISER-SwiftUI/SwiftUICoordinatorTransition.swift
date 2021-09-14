//
//  SwiftUICoordinatorTransition.swift
//  OSKit
//
//  Created by Brody Robertson on 9/14/21.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public enum SwiftUICoordinatorTransition {
    case push(AnyView)
    case pop
    case popToRoot
    case none
}

