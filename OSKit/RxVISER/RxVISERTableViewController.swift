//
//  VISERTableViewController.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import Resolver
import RxSwift

open class RxVISERTableViewController<S: IState, V: IViewDelegate>: VISERTableViewController<S, V> {
 
    public let disposeBag = DisposeBag()
    public lazy var rxStatePresenter: RxStatePresenter<S> = Resolver.root.resolve(args: self.id)
    
}
