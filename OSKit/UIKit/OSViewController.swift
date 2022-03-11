//
//  OSViewController.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import UIKit

open class OSViewController: UIViewController, IViewController, StoryboardInstantiatable {

    // TODO: - 2 CONSIDER removal if we are able to get equivalent Rx callbacks from Coordinator
    /// This is called directly by XCoordinator
    public override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: completion)

        guard let osViewControllerType = self.presentingViewController as? IViewController else {
            return
        }

        /// If this ViewController is actively presenting then we should not call didDismissPresentedViewController on the presentingViewController as dismissal is for the presentedViewController
        guard self.presentedViewController.isNil else {
            // TODO: - 2 CONSIDER calling didDismissPresetnedViewController on self
            //self.didDismissPresentedViewController(viewController: nil)
            return
        }
        
        osViewControllerType.didDismissPresentedViewController(viewController: self)

    }
    
    public override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        super.present(viewControllerToPresent, animated: flag, completion: completion)
        
        /// Note this will call didPresent before completion block is called
        self.didPresentViewController(viewController: viewControllerToPresent)
        
    }

    @objc dynamic public func didDismissPresentedViewController(viewController: UIViewController) {

    }
    
    @objc dynamic public func didPresentViewController(viewController: UIViewController) {
        
    }

}
