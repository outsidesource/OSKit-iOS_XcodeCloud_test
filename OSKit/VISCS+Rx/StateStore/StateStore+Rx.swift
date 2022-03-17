//
//  StateStore+Rx.swift
//  OSKit
//
//  Created by Brody Robertson on 2/22/22.
//

import RxSwift
import RxCocoa

extension StateStore {
    
    public class Reactive<StateType: IState> {
        
        let didUpdateBehaviorSubject: BehaviorSubject<StateType?>
        
        weak var base: StateStore<StateType>?
        
        fileprivate init(_ base: StateStore<StateType>) {
            self.base = base
            self.didUpdateBehaviorSubject = BehaviorSubject<StateType?>(value: base.state)
        }
             
    }
  
    public var rx: Reactive<StateType> {
        let reactive = Reactive(self)
        self.addSubscriber(reactive, isRetained: true)
        return reactive
    }
    
}

extension StateStore.Reactive: IStateStoreSubscriber {
    
    public func didUpdate(_ state: IState?) {
        if let state = state as? StateType {
            didUpdate(state)
        }
    }
    
    public func didUpdate(_ state: StateType?) {
        self.didUpdateBehaviorSubject.onNext(state)
        // TODO: - 0 CONSIDER onDispose { base.removeSubscriber(self) }
    }
    
}

public extension StateStore.Reactive {
    
    var state: Observable<StateType?> {
        return self.didUpdateBehaviorSubject
            .asObservable()

    }

}
