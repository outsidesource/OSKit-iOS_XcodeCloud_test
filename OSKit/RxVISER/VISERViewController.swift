//
//  VISERViewController.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import UIKit
import Resolver

// FIXME: - RENAME RxVISERViewController
open class VISERViewController<S: IState, V: IViewDelegate>: OSViewController {
 
    public let id: String = UUID().uuidString
    
    public lazy var viewDelegate: V = Resolver.root.resolve(V.self, args: self.id)
    public lazy var statePresenter: StatePresenter<S> = Resolver.root.resolve(args: self.id)
    public lazy var rxStatePresenter: RxStatePresenter<S> = Resolver.root.resolve(args: self.id)
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        viewDelegate.viewDidLoad()

        bindToStatePresenter()
        bindToViewDelegate()
        
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewDelegate.viewWillAppear()
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDelegate.viewDidAppear()
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewDelegate.viewWillDisappear()
    }
    
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewDelegate.viewDidDisappear()
    }
    
    open func bindToStatePresenter() {
        
    }
    
    open func bindToViewDelegate() {
        
    }
    
}
