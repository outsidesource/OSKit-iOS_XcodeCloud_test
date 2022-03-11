//
//  OSTableViewController+Rx.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import RxSwift
import RxSwiftExt

extension Reactive where Base: OSTableViewController {

    var didDismissPresentedViewController: Observable<UIViewController> {
        return self.methodInvoked(#selector(Base.didDismissPresentedViewController(viewController:)))
            .map { parameters in
                return parameters[0] as? UIViewController
            }
            .unwrap()
    }
    
    var didPresentViewController: Observable<UIViewController> {
        return self.methodInvoked(#selector(Base.didPresentViewController(viewController:)))
            .map { parameters in
                return parameters[0] as? UIViewController
            }
            .unwrap()
    }

}
