//
//  CombineInteractor.swift
//  OSKit
//
//  Created by Brody Robertson on 9/13/21.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import Resolver

@available(iOS 13.0, *)
open class CombineInteractor<S: IState>: VISERInteractor<S> {
    
    public lazy var combineStatePresenter: CombineStatePresenter<S> = Resolver.root.resolve(args: self.id)
    
}
