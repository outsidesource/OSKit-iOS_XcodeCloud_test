//
//  UIStackView+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import UIKit

public extension UIStackView {
    
    func removeAllArrangedSubviews() {
        self.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    func setViews(_ views: [UIView]) {
        self.removeAllArrangedSubviews()
        self.addArrangedSubviews(views)
    }
    
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
    
    func viewForTag(_ tag: Int?) -> UIView? {
        return self.arrangedSubviews.first { view in
            return view.tag == tag
        }
    }
    
    func removeArrangedSubviewsWithDefaultTag() {
        for view in self.arrangedSubviews {
            
            if view.tag == 0 {
                self.removeArrangedSubview(view)
            }
            
        }
    }
    
    func removeArrangedSubviewContainedInTags(_ tags: [Int]) {
        
        for view in self.arrangedSubviews {
            
            if tags.contains(where: { tag in
                view.tag == tag
            }) {
                self.removeArrangedSubview(view)
            }
            
        }
        
    }
    
    func removeArrangedSubviewsNotContainedInTags(_ tags: [Int]) {
        
        for view in self.arrangedSubviews {
            
            if !tags.contains(where: { tag in
                view.tag == tag
            }) {
                self.removeArrangedSubview(view)
            }
            
        }
        
    }
    
}
