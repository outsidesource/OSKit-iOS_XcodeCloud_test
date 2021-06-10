//
//  IViewController.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import UIKit

public protocol IViewController {
    func didDismissPresentedViewController(viewController: UIViewController)
    func didPresentViewController(viewController: UIViewController)
}
