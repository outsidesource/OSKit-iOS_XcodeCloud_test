//
//  View+OS.swift
//  OSKit
//
//  Created by Brody Robertson on 8/16/21.
//

import SwiftUI

@available(iOS 13.0, *)
extension View {

    func navigationLink<Destination: View>(destination: Binding<Destination?>) -> some View {
        
        let isActive = Binding(
            get: { () -> Bool in
                return destination.wrappedValue != nil
            },
            set: { value in
                if !value {
                    destination.wrappedValue = nil
                }
            }
        )
        
        return navigationLink(isActive: isActive, destination: destination.wrappedValue)
        
    }
    
    func navigationLink<Destination: View>(isActive: Binding<Bool>, destination: Destination) -> some View {
        
        overlay(
            NavigationLink(
                destination: isActive.wrappedValue ? destination : nil,
                isActive: isActive,
                label: { EmptyView() }
            )
        )
        
    }
    
    func navigationLink(_ action: @escaping () -> Void) -> some View {

        let isActive = Binding(
            get: { false },
            set: { newValue in
                if newValue {
                    action()
                }
            }
        )

        return NavigationLink(
            destination: EmptyView(),
            isActive: isActive
        ) {
            self
        }


    }

    func navigationLink<Item, Destination: View>(item: Binding<Item?>, @ViewBuilder destination: (Item) -> Destination) -> some View {

        let isActive = Binding(
            get: { item.wrappedValue != nil },
            set: { value in
                if !value {
                    item.wrappedValue = nil
                }
            }
        )

        return navigationLink(isActive: isActive) {
            item.wrappedValue.map(destination)
        }

    }

    func navigationLink<Destination: View>(isActive: Binding<Bool>, @ViewBuilder destination: () -> Destination) -> some View {

        overlay(
            NavigationLink(
                destination: isActive.wrappedValue ? destination() : nil,
                isActive: isActive,
                label: { EmptyView() }
            )
        )

    }

}
