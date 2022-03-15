//
//  WeakBox.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

public final class WeakBox<ElementType: AnyObject>: IObjectBox {
    
    public weak var element : ElementType?
    
    init(_ element: ElementType) {
        self.element = element
    }
    
}

extension WeakBox: Equatable where ElementType: Equatable {
    
    public static func == (lhs: WeakBox<ElementType>, rhs: WeakBox<ElementType>) -> Bool {
        return lhs.element == rhs.element
    }
    
}

extension WeakBox: Hashable where ElementType: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(element)
    }
    
}

public extension WeakBox {
    var anyBox: AnyBox<ElementType> {
        return AnyBox<ElementType>(self)
    }
}
