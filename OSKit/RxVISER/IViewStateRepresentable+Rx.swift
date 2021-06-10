//
//  IViewStateRepresentable+Rx.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import RxSwift
import RxCocoa

// TODO: - 0 ADD SwiftUI extensions

extension Reactive where Base: UIView {

    public var viewState: Binder<IViewState> {
        Binder(base) { base, viewState in
            base.setViewState(viewState)
        }
    }

}

extension Reactive where Base: UINavigationItem {

    public var viewState: Binder<IViewState> {
        Binder(base) { base, navigationItemState in
            base.setViewState(navigationItemState)
        }
    }

}
