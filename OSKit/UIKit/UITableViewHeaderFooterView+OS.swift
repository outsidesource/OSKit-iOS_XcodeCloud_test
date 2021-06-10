//
//  UITableViewHeaderFooterView+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import UIKit

public extension UITableViewHeaderFooterView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}
