//
//  CoordinatorViewModifier.swift
//  OSKit
//
//  Created by Brody Robertson on 8/19/21.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public struct CoordinatorViewModifier: ViewModifier {
    
    @ObservedObject var coordinator: SwiftUICoordinator
    
    public func body(content: Content) -> some View {
        content.navigationLink(destination: $coordinator.navLinkDestination)
    }
    
}

@available(iOS 13.0, *)
public extension View {
    
    func coordinate(coordinator: SwiftUICoordinator) -> some View {
        ModifiedContent(content: self, modifier: CoordinatorViewModifier(coordinator: coordinator))
    }
    
}
