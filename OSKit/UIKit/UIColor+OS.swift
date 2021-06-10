//
//  UIColor+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import UIKit

// TODO: - 0 REFACTOR to use Struct and align to system / element colors
public protocol UIColorTheme {
    
    static var brand: UIColor { get }
    static var lightBrand: UIColor { get }
    
    static var labelText: UIColor { get }
    
    static var buttonText: UIColor { get }
    static var buttonTextHighlight: UIColor { get }
    static var buttonBackground: UIColor { get }
    static var buttonBackgroundHighlighted: UIColor { get }
    static var buttonBackgroundSelected: UIColor { get }
    static var buttonBackgroundDisabled: UIColor { get }
    
    static var navigationBarBackground: UIColor { get }
    
    static var tableHeaderViewBackground: UIColor { get }
    static var tableFooterViewBackground: UIColor { get }
    
    static var textFieldBackground: UIColor { get }
    static var textFieldBorder: UIColor { get }
    
}

public extension UIColorTheme {
    
    static var brand: UIColor {
        return .blue
    }
    
    static var lightBrand: UIColor {
        return .blue
    }
    
    static var labelText: UIColor {
        return .darkText
    }
    
    static var buttonText: UIColor {
        return .darkText
    }
    
    static var buttonTextHighlight: UIColor {
        return .darkText
    }
    
    static var buttonBackground: UIColor {
        return .white
    }
    
    static var buttonBackgroundHighlighted: UIColor {
        return .lightGray
    }
    
    static var buttonBackgroundSelected: UIColor {
        return .gray
    }
    
    static var buttonBackgroundDisabled: UIColor {
        return .darkGray
    }
    
    static var navigationBarBackground: UIColor {
        return .white
    }
    
    static var tableHeaderViewBackground: UIColor {
        return .white
    }
    
    static var tableFooterViewBackground: UIColor {
        return .white
    }
    
    static var textFieldBackground: UIColor {
        return .lightGray
    }
    
    static var textFieldBorder: UIColor {
        return .darkGray
    }
    
}

extension UIColor: UIColorTheme { }

public extension UIColor {
    
    var image: UIImage? {
        return UIImage.color(self)
    }
    
    static var random: UIColor {
        
        let red = CGFloat(arc4random() % 256) / 255
        let green = CGFloat(arc4random() % 256) / 255
        let blue = CGFloat(arc4random() % 256) / 255
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
        
    }
    
}
