//
//  OSTextField.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import UIKit

@IBDesignable public class OSTextField: UITextField {
    
    @IBInspectable public var leftEdgeInset: CGFloat {
        get {
            return textFieldEdgeInsets.left
        }
        set {
            textFieldEdgeInsets = UIEdgeInsets(top: textFieldEdgeInsets.top, left: newValue, bottom: textFieldEdgeInsets.bottom, right: textFieldEdgeInsets.right)
        }
    }

    @IBInspectable public var rightEdgeInset: CGFloat {
        get {
            return textFieldEdgeInsets.right
        }
        set {
            textFieldEdgeInsets = UIEdgeInsets(top: textFieldEdgeInsets.top, left: textFieldEdgeInsets.left, bottom: textFieldEdgeInsets.bottom, right: newValue)
        }
    }

    var textFieldEdgeInsets: UIEdgeInsets = UIEdgeInsets.zero

    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textFieldEdgeInsets)
    }

    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textFieldEdgeInsets)
    }
    
}
