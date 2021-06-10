//
//  UINavigationController+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import UIKit

public extension UINavigationController {
    
    func containsViewController(kind: UIViewController.Type) -> Bool {
        
        return self.viewControllers.contains { (viewController) -> Bool in
            return viewController.isKind(of: kind)
        }
        
    }
    
}
