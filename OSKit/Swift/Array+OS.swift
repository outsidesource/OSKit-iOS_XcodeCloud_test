//
//  Array+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

public extension Array {
    
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    /// Ex. myArray[safe: 0]
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    func chunked(into size: Int) -> [[Element]] {
        
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
        
    }
    
    mutating func removeFirst(where predicate: @escaping (Element) throws -> Bool) {
        
        guard let index = try? self.firstIndex(where: predicate) else {
            return
        }

        self.remove(at: index)
        
    }
    
}

public extension Array where Element: Equatable {
    
    func contains(_ array: [Element]) -> Bool {
        for item in array {
            if !self.contains(item) { return false }
        }
        return true
    }
    
    func containsAny(_ array: [Element]) -> Bool {
        for item in array {
            if self.contains(item) { return true }
        }
        return false
    }
    
    mutating func removeFirst(element: Element) {
        
        guard let index = self.firstIndex(of: element) else {
            return
        }
        
        self.remove(at: index)
        
    }
    
    var allEqual: Bool {
        return self.allSatisfy({ $0 == self.first })
    }
    
    func index(after element: Element, wrap: Bool = true) -> Array.Index? {
        
        guard let currentIndex = self.firstIndex(of: element) else {
            return nil
        }

        var nextIndex = self.index(after: currentIndex)
        if nextIndex >= self.endIndex {
            if wrap {
                nextIndex = self.startIndex
            } else {
                return nil
            }
        }

        return nextIndex
        
    }
    
    func element(after element: Element, wrap: Bool = true) -> Element? {

        guard let nextIndex = self.index(after: element) else {
            return nil
        }

        return self[safe: nextIndex]
        
    }
    
}

public extension Array where Element: IStringIdentifiable {
    
    func firstIndex(id: String) -> Int? {
        return self.firstIndex { stringIdentifiable -> Bool in
            return stringIdentifiable.id == id
        }
    }
    
    mutating func removeFirst(id: String) {
        
        self.removeFirst { stringIdentifiable -> Bool in
            return stringIdentifiable.id == id
        }
        
    }
    
}
