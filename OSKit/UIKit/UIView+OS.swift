//
//  UIView+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2018 Outside Source. All rights reserved.
//

import UIKit

public extension UIView {
    
    var origin: CGPoint {
        return self.frame.origin
    }
    
    var size: CGSize {
        return self.frame.size
    }
    
    var x: CGFloat {
        
        get {
            return self.frame.origin.x
        }
        
        set {
            self.frame = CGRect(origin: CGPoint(x: newValue, y: self.y), size: self.size)
        }
        
    }
    
    var y: CGFloat {
        
        get {
            return self.frame.origin.y
        }
        
        set {
            self.frame = CGRect(origin: CGPoint(x: self.x, y: newValue), size: self.size)
        }
        
    }
    
    var width: CGFloat {
        
        get {
            return self.size.width
        }
        
        set {
            self.frame = CGRect(origin: self.origin, size: CGSize(width: newValue, height: self.height))
        }
    }
    
    var height: CGFloat {
        
        get {
            return self.size.height
        }
        
        set {
            self.frame = CGRect(origin: self.origin, size: CGSize(width: self.width, height: newValue))
        }
    }
    
    var right: CGFloat {
        
        get {
            return self.x + self.width
        }
        
        set {
            self.frame = CGRect(origin: CGPoint(x: newValue - self.width, y: self.y), size: self.size)
        }
        
    }
    
    var bottom: CGFloat {
        
        get {
            return self.y + self.height
        }
        
        set {
            self.frame = CGRect(origin: CGPoint(x: self.x, y: newValue - self.height), size: self.size)
        }
        
    }
    
    func removeSubviews() {
        
        self.subviews.forEach {
            $0.removeFromSuperview()
        }
        
    }
    
    var firstResponder: UIView? {
        
        guard !isFirstResponder else {
            return self
        }
        
        for subview in subviews {
            
            if let firstResponder = subview.firstResponder {
                return firstResponder
            }
            
        }
        
        return nil
    }
    
    func animateRotation(duration: TimeInterval, delay: TimeInterval, options: UIView.KeyframeAnimationOptions, completion: ((Bool) -> ())?) {
        
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: options, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.transform = CGAffineTransform(rotationAngle: 3*CGFloat.pi/2)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.transform = CGAffineTransform(rotationAngle: 2*CGFloat.pi)
            })
            
        }, completion: completion)
        
    }
    
    func animateScale(scale: CGFloat, duration: TimeInterval, delay: TimeInterval, options: UIView.AnimationOptions, completion: ((Bool) -> ())?) {
        
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: {
            self.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: completion)
        
    }
    
    func animateAlpha(alpha: CGFloat, duration: TimeInterval, delay: TimeInterval, options: UIView.AnimationOptions, completion: ((Bool) -> ())?) {
        
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: {
            self.alpha = alpha
        }, completion: completion)
        
    }
    
    func animateLayout(duration: TimeInterval, delay: TimeInterval, options: UIView.AnimationOptions, completion: ((Bool) -> ())?) {
        
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: {
            self.layoutIfNeeded()
        }, completion: completion)
        
    }
    
}

public protocol NibInstantiatable: AnyObject {
    
    static var nibName: String { get }
    static var nib: UINib { get }
    static var bundle: Bundle { get }
    
}

public extension NibInstantiatable {
    
    static var nibName: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        let bundle = Bundle(for: self)
        return UINib(nibName: nibName, bundle: bundle)
    }
    
    static var bundle: Bundle {
        return Bundle(for: self)
    }
    
}

public extension NibInstantiatable where Self: UIView {

    static func initWithNib(_ name: String = nibName) -> Self? {
        
        let nib = self.bundle.loadNibNamed(name, owner: self, options: nil)
        return nib?.first as? Self
        
    }
    
}
