//
//  UIButton+Extension.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import UIKit

var disabledColorHandle: UInt8 = 0
var highlightedColorHandle: UInt8 = 0
var selectedColorHandle: UInt8 = 0

@IBDesignable public extension UIButton {
        
    func setBackgroundColor(_ color: UIColor?, for state: UIControl.State) {
        self.setBackgroundImage(color?.image, for: state)
    }
    
    @IBInspectable
    var normalBackgroundImageColor: UIColor? {
        get {
            return nil
        }
        set {
            self.setBackgroundColor(newValue, for: .normal)
        }
    }
    
    @IBInspectable
    var disabledColor: UIColor? {
        get {
            return nil
        }
        set {
            self.setBackgroundColor(newValue, for: .disabled)
        }
    }
    
    @IBInspectable
    var highlightedColor: UIColor? {
        get {
            return nil
        }
        set {
            self.setBackgroundColor(newValue, for: .highlighted)
        }
    }
    
    @IBInspectable
    var selectedColor: UIColor? {
        get {
            return nil
        }
        set {
            self.setBackgroundColor(newValue, for: .selected)
        }
    }

}

public extension UIButton {

    func setDynamicFontSize() {
        NotificationCenter.default.addObserver(self, selector: #selector(setButtonDynamicFontSize),
                                               name: UIContentSizeCategory.didChangeNotification,
                                               object: nil)
    }

    @objc func setButtonDynamicFontSize() {
        self.titleLabel?.font = UIFont.preferredFont(forTextStyle: .callout)
        self.titleLabel?.adjustsFontForContentSizeCategory = true
    }

}
