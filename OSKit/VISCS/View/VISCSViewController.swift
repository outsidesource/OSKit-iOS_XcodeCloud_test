//
//  VISCSViewController.swift
//  OSKit
//
//  Created by Brody Robertson
//  Copyright © 2020 Outside Source. All rights reserved.
//

import UIKit

open class VISCSViewController<StateType: IState>: UIViewController, StoryboardInstantiatable, IVISCSViewController {
    
    /// The viewDelegate of ViewController lifecycle
    ///
    /// - Note: The viewDelegate is strong because the ViewController should retain the VIewInteractor (IViewDelegate)
    ///  We chose not to make ViewController generic about IViewDelegate becuase it is not part of its type identity
    ///  Instead we will favor composition of more specific delegates in subclasses similar to UIKit ViewControllers
    ///  Ex. UITableViewDelegate: UIScrollViewDelegate
    public var viewDelegate: IViewDelegate?
    
    /// The StateStore which provides StateType to the ViewController
    public weak var stateStore: StateStore<StateType>?
    
    override open func viewDidLoad() {
        super.viewDidLoad()

        initStateStore()
        initViewDelegate()
        
        viewDelegate?.viewDidLoad()
        
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewDelegate?.viewWillAppear()
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDelegate?.viewDidAppear()
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewDelegate?.viewWillDisappear()
    }
    
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewDelegate?.viewDidDisappear()
    }
    
    /// Override in subclasses to subscribe to the StateStore and update presentation
    open func initStateStore() {
        
    }
    
    /// Override in subclasses to call subclass specific IViewDelegate
    open func initViewDelegate() {
        
    }
    
}
