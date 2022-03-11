//
//  UIColor+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import UIKit

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
