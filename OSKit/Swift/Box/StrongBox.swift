//
//  StrongBox.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

public final class StrongBox<ElementType: AnyObject>: IObjectBox {
    
    public var element : ElementType?
    
    init(_ element: ElementType) {
        self.element = element
    }
    
}

extension StrongBox: Equatable where ElementType: Equatable {
    
    public static func == (lhs: StrongBox<ElementType>, rhs: StrongBox<ElementType>) -> Bool {
        return lhs.element == rhs.element
    }
    
}

extension StrongBox: Hashable where ElementType: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(element)
    }
    
}

public extension StrongBox {
    var anyBox: AnyBox<ElementType> {
        return AnyBox<ElementType>(self)
    }
}
