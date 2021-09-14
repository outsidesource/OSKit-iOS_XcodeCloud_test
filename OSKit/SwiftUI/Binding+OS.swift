//
//  Binding+OS.swift
//  OSKit-Example
//
//  Created by Brody Robertson on 7/14/21.
//

import SwiftUI

@available(iOS 13.0, *)
func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
    
}
