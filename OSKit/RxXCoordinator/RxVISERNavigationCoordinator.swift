//
//  VISERCoordinator.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import Resolver
import RxSwift
import XCoordinator

open class RxVISERNavigationCoordinator<S: ICoordinatorState, R: IRoute & Route>: NavigationCoordinator<R>, ICoordinator {
    
    public let id: String
    public let disposeBag = DisposeBag()
    
    @Injected public private(set) var actionDispatcher: IActionDispatcher
    public lazy var rxStatePresenter: RxStatePresenter<S> = Resolver.root.resolve(args: self.id)
    
    deinit {
        self.dispatch(StateContainerAction.deinitState(id))
    }
        
    public init(_ id: String = UUID().uuidString, rootViewController: RootViewController = .init(), initialRoute: RouteType? = nil) {
        
        self.id = id
        super.init(rootViewController: rootViewController, initialRoute: initialRoute)
        bindToRoutes()
        /// It is the responsibility of subclasses to inflate initial state and dispatch accordingly
        
    }

    public init(_ id: String = UUID().uuidString, rootViewController: RootViewController = .init(), root: Presentable) {
        
        self.id = id
        super.init(rootViewController: rootViewController, root: root)
        bindToRoutes()
        /// It is the responsibility of subclasses to inflate initial state and dispatch accordingly
        
    }
    
    private func bindToRoutes() {
        
        self.rxStatePresenter.state
            // TODO: - 1 CONSIDER alternatives to evaluating changes to routes queue, this approach could fail if routes contains multiple contiguous instances of same route
            .map { $0?.routes.first }
            .distinctUntilChanged { route in
                return route?.id
            }
            .unwrap()
            .withUnretained(self)
            .flatMapLatest { (weakSelf, route) -> Single<()> in

                /// Route will always be R
                /// This is necessary to avoid introduction of Self constraints in IRoute
                // TODO: - 2 CONSIDER fundamentally modelling Routes differently - instead of using enums we could use static extensions on a concrete OSKit.Route which conforms to XCoordinator.Route, thereby allowing all coordinators to operate on a single Route type.
                guard let route = route as? R else {
                    return .just(())
                }

                return weakSelf.triggerRoute(route)
                    .map { _ in () }
                
            }
            .subscribe()
            .disposed(by: disposeBag)
            
    }
    
    private func triggerRoute(_ route: R) -> Single<IRoute> {
        
        return rx.trigger(route)
            .take(1)
            .map { route }
            .asSingle()
            .doDispatchRxAction(actionDispatcher, CoordinatorAction.TriggerRoute(id: id))
        
    }
    
}
