//
//  IBox.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

public protocol IBox {
    associatedtype ElementType
    var element: ElementType? { get }
    // TODO: - 1 IMPROVE by adding init and default extension
}
