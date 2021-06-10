//
//  ViewDelegate.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import UIKit

// TODO: - 0 CONSIDER creating base viewController classes that override all lifecycle so we get dispatching of all lifecycle actions automatically
public protocol IViewDelegate: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    // TODO: - 0 CONSIDER removal of some of these
    func didUpdateKeyboardRect(rect: CGRect?)
    func didPresentViewController(_: UIViewController)
    func didDismissPresentedViewController(_: UIViewController)
    func didTapPrimaryButton()
    func didTapSecondaryButton()
    func didTapCloseButton()
}

public extension IViewDelegate {
    
    /// We provide empty default implementation which effectively makes these optional implementations
    func viewDidLoad() { }
    func viewWillAppear() { }
    func viewDidAppear() { }
    func viewWillDisappear() { }
    func viewDidDisappear() { }
    
    // TODO: - 0 CONSIDER removal of some of these
    func didUpdateKeyboardRect(rect: CGRect?) { }
    func didPresentViewController(_ viewController: UIViewController) { }
    func didDismissPresentedViewController(_ viewController: UIViewController) { }
    func didTapPrimaryButton() { }
    func didTapSecondaryButton() { }
    func didTapCloseButton() { }
}
