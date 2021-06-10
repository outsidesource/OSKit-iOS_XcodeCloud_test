//
//  UITableView+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import UIKit

public extension UITableView {

    func registerClassForHeaderFooterViewReuse(_ aClass: AnyClass) {
        self.register(aClass, forHeaderFooterViewReuseIdentifier: String(describing: aClass.self))
    }

    func dequeueReusableHeaderFooterView<C: AnyObject>(_ aClass: C.Type) -> C? {
        return self.dequeueReusableHeaderFooterView(withIdentifier: String(describing: aClass)) as? C
    }

    func contains(_ indexPath: IndexPath) -> Bool {
        return self.numberOfRows(inSection: indexPath.section) > indexPath.row
    }
    
}
