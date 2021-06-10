//
//  StaticTransitionAnimation+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import UIKit
import XCoordinator

public extension StaticTransitionAnimation {
    
    static let slideRightPresentation = StaticTransitionAnimation(duration: 0.25, performAnimation: { transitionContext in
        
        let containerView = transitionContext.containerView
        let fromView = transitionContext.view(forKey: .from)
        let toView = transitionContext.view(forKey: .to)!
        
        toView.right = 0
        containerView.addSubview(toView)
        
        UIView.animate(withDuration: 0.25, animations: {
            toView.x = 0
        }, completion: { _ in
            fromView?.removeFromSuperview()
            transitionContext.completeTransition(true)
        })
        
    })
    
    static let slideLeftDismissal = StaticTransitionAnimation(duration: 0.25, performAnimation: { transitionContext in
        
        let containerView = transitionContext.containerView
        let fromView = transitionContext.view(forKey: .from)!
        
        UIView.animate(withDuration: 0.25, animations: {
            fromView.right = 0
        }, completion: { _ in
            fromView.removeFromSuperview()
            transitionContext.completeTransition(true)
        })
        
    })
    
    static let fadePresentation = StaticTransitionAnimation(duration: 0.5, performAnimation: { transitionContext in
        
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        
        toView.alpha = 0.0
        containerView.addSubview(toView)
        
        UIView.animate(withDuration: 0.5, animations: {
            toView.alpha = 1.0
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
        
    })
    
    static let flippingPresentation = StaticTransitionAnimation(duration: 0.5, performAnimation: { transitionContext in
        
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        
        let snapshotView = toView.snapshotView(afterScreenUpdates: true)!
        
        UIView.transition(with: containerView, duration: 0.5, options: [.transitionFlipFromLeft], animations: {
            containerView.addSubview(snapshotView)
        }, completion: { _ in
            containerView.addSubview(toView)
            snapshotView.removeFromSuperview()
            transitionContext.completeTransition(true)
        })
        
    })
    
}
