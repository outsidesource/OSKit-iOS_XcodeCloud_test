//
//  Box.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

public final class Box<ElementType>: IBox {
    
    public var element : ElementType?
    
    init(_ element: ElementType) {
        self.element = element
    }
    
}

extension Box: Equatable where ElementType: Equatable {
    
    public static func == (lhs: Box<ElementType>, rhs: Box<ElementType>) -> Bool {
        return lhs.element == rhs.element
    }
    
}

extension Box: Hashable where ElementType: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(element)
    }
    
}

public extension Box {
    var anyBox: AnyBox<ElementType> {
        return AnyBox<ElementType>(self)
    }
}
