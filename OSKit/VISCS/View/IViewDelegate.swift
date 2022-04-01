//
//  ViewDelegate.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import UIKit

public protocol IViewDelegate: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

public extension IViewDelegate {
    
    /// We provide empty default implementation which effectively makes these optional implementations
    func viewDidLoad() { }
    func viewWillAppear() { }
    func viewDidAppear() { }
    func viewWillDisappear() { }
    func viewDidDisappear() { }
}
