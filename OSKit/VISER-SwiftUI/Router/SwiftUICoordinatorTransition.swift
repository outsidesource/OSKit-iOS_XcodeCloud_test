//
//  SwiftUICoordinatorTransition.swift
//  OSKit-Example
//
//  Created by Brody Robertson on 9/14/21.
//

import SwiftUI

@available(iOS 13.0, *)
public enum SwiftUICoordinatorTransition {
    case push(AnyView)
    case pop
    case popToRoot
    case none
}

