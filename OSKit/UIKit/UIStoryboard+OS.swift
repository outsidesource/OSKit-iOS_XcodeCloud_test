//
//  UIStoryboard+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static func initialViewController(name: String, bundle storyboardBundleOrNil: Bundle?) -> UIViewController {
        
        let storyboard = UIStoryboard(name: name, bundle: storyboardBundleOrNil)
        
        guard let viewController = storyboard.instantiateInitialViewController() else {
            fatalError("Error instantiating initial viewController from \(storyboard)")
        }
        
        return viewController
        
    }
    
    static func viewController(name: String, bundle storyboardBundleOrNil: Bundle?, withIdentifier identifier: String) -> UIViewController {
        
        let storyboard = UIStoryboard(name: name, bundle: storyboardBundleOrNil)
        
        return storyboard.instantiateViewController(withIdentifier: identifier)
        
    }
    
}
