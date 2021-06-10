//
//  Collection+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2018 Outside Source. All rights reserved.
//

public extension Collection {
    
    /// Returns optional element for index
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }

}

public extension Collection where Element: BinaryInteger {
    
    /// Returns the average of all elements in the array
    func average() -> Element { isEmpty ? .zero : sum() / Element(count) }
    
    /// Returns the average of all elements in the array as Floating Point type
    func average<T: FloatingPoint>() -> T {
        isEmpty ? .zero: T(sum()) / T(count)
    }
    
}

public extension Collection where Element: BinaryFloatingPoint {
    
    /// Returns the average of all elements in the array
    func average() -> Element { isEmpty ? .zero : Element(sum()) / Element(count) }
    
}
