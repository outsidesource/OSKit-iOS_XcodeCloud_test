//
//  UIScrollView+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import UIKit

public extension UIScrollView {
    
    func setInsetsForKeyboardRect(_ keyboardRect: CGRect?) {
        
        if let keyboardRect = keyboardRect {
            
            let insets = self.insetsForKeyboardRect(keyboardRect)
            
            self.contentInset = insets
            self.scrollIndicatorInsets = insets
            
        } else {
            
            self.contentInset = UIEdgeInsets.zero
            self.scrollIndicatorInsets = UIEdgeInsets.zero
            
        }
        
    }
    
    func insetsForKeyboardRect(_ keyboardRect: CGRect) -> UIEdgeInsets {
        
        /// We must have a window reference to properly convert coordinates
        guard let window = self.window, let superview = self.superview else {
            return .zero
        }
        
        /// Convert screen coordinates to window
        /// If we use from: nil it uses screen base coordinate system which is the coordinate space of keyboardRect
        let windowRect = window.convert(keyboardRect, from: nil)
        
        /// Convert window coordinates to view
        /// If we use from: nil it uses window base coordinate system
        let convertedKeyboardRect = superview.convert(windowRect, from: nil)
        
        let bottomDelta = self.bottom - convertedKeyboardRect.origin.y
        
        let bottomInset = bottomDelta > 0 ? bottomDelta : 0
        
        return UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
        
    }
    
}
