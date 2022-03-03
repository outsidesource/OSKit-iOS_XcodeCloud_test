//
//  VISERTableViewController.swift
//  OSKit
//
//  Created by Brody Robertson on 9/14/21.
//  Copyright © 2021 Outside Source. All rights reserved.
//

import UIKit
import Resolver

//open class VISERTableViewController<S: IState, V: IViewDelegate>: OSTableViewController {
// 
//    public let id: String = UUID().uuidString
//    
//    public lazy var viewDelegate: V = Resolver.root.resolve(V.self, args: self.id)
//    public lazy var stateStore: StateStore<S> = Resolver.root.resolve(args: self.id)
//    
//    override open func viewDidLoad() {
//        super.viewDidLoad()
//        
//        viewDelegate.viewDidLoad()
//
//        bindToStateStore()
//        bindToViewDelegate()
//        
//    }
//    
//    override open func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        viewDelegate.viewWillAppear()
//    }
//    
//    override open func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        viewDelegate.viewDidAppear()
//    }
//    
//    override open func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        viewDelegate.viewWillDisappear()
//    }
//    
//    override open func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        viewDelegate.viewDidDisappear()
//    }
//    
//    open func bindToStateStore() {
//        
//    }
//    
//    open func bindToViewDelegate() {
//        
//    }
//    
//}
