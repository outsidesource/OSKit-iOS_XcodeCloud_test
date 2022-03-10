//
//  AnyBox.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

/// Type-erasure of IBox
public class AnyBox<ElementType>: IBox {

    private let _element: () -> ElementType?
    
    init<BoxType: IBox>(_ box: BoxType) where BoxType.ElementType == ElementType {
        _element = { box.element }
    }

    public var element: ElementType? {
        _element()
    }
    
}
