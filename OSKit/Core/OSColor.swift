//
//  OSColor.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import UIKit

public struct OSColor {
    
    let name: OSLocalizedString?
    let red: Float
    let green: Float
    let blue: Float
    let alpha: Float
    
    var uiColor: UIColor {
        return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
    }
    
    public init(name: OSLocalizedString?, red: Float, green: Float, blue: Float, alpha: Float) {
        self.name = name
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    public func test() {
        print("test called")
    }
    
}

extension OSColor: Codable { }
extension OSColor: Equatable { }

extension OSColor: CustomStringConvertible {
    
    public var description: String {
        return name?.description ?? ""
    }
    
}
