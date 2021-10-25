//
//  SwiftUICoordinator.swift
//  OSKit
//
//  Created by Brody Robertson on 8/16/21.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import Combine
import SwiftUI
import Resolver

@available(iOS 13.0, *)
open class SwiftUICoordinator: ICoordinator, ObservableObject {

    private var logDomains: [OSLog.Domain] = [.coordinator]

    public let id: String = UUID().uuidString
    @Injected public private(set) var actionDispatcher: IActionDispatcher
    public lazy var statePresenter: StatePresenter<CoordinatorState> = Resolver.root.resolve(args: self.id)
    
    var cancellables = Set<AnyCancellable>()
    @ObservedObject public var combineStatePresenter: CombineStatePresenter<CoordinatorState>
    
    var parent: SwiftUICoordinator?
    
    @Published var navLinkDestination: AnyView?
    
    // TODO: - 1 CONSIDER if we can use this approach instead of @Published var navLinkDestination: AnyView?
//    @Published var navLinkViewBuilder: ViewBuilder?
    
//    @ViewBuilder
//    private func pushingView() -> some View {
//        PushingView()
//    }
    
    deinit {
        self.dispatch(StateContainerAction.deinitState(id))
    }
    
    public init(parent: SwiftUICoordinator? = nil) {
        
        self.combineStatePresenter = Resolver.root.resolve(args: id)
        self.parent = parent
        
        bindToRoutes()
        
    }

    var root: SwiftUICoordinator {
        return parent?.root ?? self
    }

    private func bindToRoutes() {
        
        self.combineStatePresenter.$state
            .map { $0?.routes }
            .removeDuplicates(by: { routes1, routes2 in
                // TODO: - 0 IMPROVE this evaluation
                routes1?.first?.id == routes2?.first?.id
            })
            .compactMap { $0?.first }
            .sink { [weak self] route in
                self?.triggerRoute(route)
            }
            .store(in: &cancellables)
            
    }
    
    public func queueRoute(_ route: IRoute) {
        self.dispatch(CoordinatorAction.QueueRoute(id: id, route: route))
    }
    
    public func triggerRoute(_ route: IRoute) {
        
        let transition = self.prepareTransition(for: route)
        self.performTransition(transition)
        self.didTriggerRoute(route)
        
    }
    
    open func prepareTransition(for route: IRoute) -> SwiftUICoordinatorTransition {
        return .none
    }
    
    private func performTransition(_ transition: SwiftUICoordinatorTransition) {
        
        switch transition {
        
        case .push(let view):
            self.navLinkDestination = view
            
        case .pop:
            self.parent?.navLinkDestination = nil
            
        case .popToRoot:
            self.root.navLinkDestination = nil
            
        case .none:
            break
        }
        
    }
    
    private func didTriggerRoute(_ route: IRoute) {
        self.dispatch(CoordinatorAction.TriggerRoute(id: id, route: route))
    }
    
}
