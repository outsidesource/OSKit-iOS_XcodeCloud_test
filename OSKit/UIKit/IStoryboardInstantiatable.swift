//
//  UIViewController+Storyboard.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import UIKit

// TODO: - 0 REVIEW & RENAME to IStoryboardInstantiatable
public protocol IStoryboardInstantiatable: AnyObject {
    
    static var storyboardIdentifier: String { get }
    
}

public extension IStoryboardInstantiatable {
    
    static var storyboardName: String {
        return String(describing: self)
    }
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
}

public extension IStoryboardInstantiatable where Self: UIViewController {
    
    static func initWithStoryboard(name: String = storyboardName, bundle storyboardBundleOrNil: Bundle? = nil, withIdentifier identifier: String = storyboardIdentifier) -> Self? {
        guard let viewController = UIStoryboard.viewController(name: name, bundle: storyboardBundleOrNil, withIdentifier: identifier) as? Self else {
            assertionFailure("viewController is nil")
            return nil
        }
        return viewController
    }
    
}
