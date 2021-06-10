//
//  UIViewController+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    var isPresenting: Bool {
        return self.presentedViewController.isSome
    }
    
    func add(_ child: UIViewController, frame: CGRect? = nil) {
        
        addChild(child)
        
        if let frame = frame {
            child.view.frame = frame
        }
        
        view.addSubview(child.view)
        child.didMove(toParent: self)
        
    }
    
    func remove() {
        
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
        
    }
    
}
