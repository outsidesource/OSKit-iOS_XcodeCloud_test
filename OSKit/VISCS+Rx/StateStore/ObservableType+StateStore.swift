//
//  ObservableType+StateStore.swift
//  OSKit
//
//  Created by Brody Robertson on 3/4/22.
//

import RxSwift

public extension ObservableType {

    func reduceState<StateType: IState>(_ stateStore: StateStore<StateType>, reducer: @escaping (StateType?, AsyncState<Element, Error>) -> (StateType?)) -> Observable<Element> {

        return self
            .do(onNext: { [weak stateStore] element in
                
                let asyncState: AsyncState<Element, Error> = .element(element)
                
                stateStore?.reduceState { state in
                    return reducer(state, asyncState)
                }
                
            }, onError: { [weak stateStore] error in
                
                let asyncState: AsyncState<Element, Error> = .error(error)
                
                stateStore?.reduceState { state in
                    return reducer(state, asyncState)
                }
                
            }, onCompleted: { [weak stateStore] in
                
                let asyncState: AsyncState<Element, Error> = .complete(nil)
                
                stateStore?.reduceState { state in
                    return reducer(state, asyncState)
                }
                
            }, onSubscribe: { [weak stateStore] in
                
                let asyncState: AsyncState<Element, Error> = .idle
                
                stateStore?.reduceState { state in
                    return reducer(state, asyncState)
                }
                
            }, onSubscribed: { [weak stateStore] in
                
                let asyncState: AsyncState<Element, Error> = .busy
                
                stateStore?.reduceState { state in
                    return reducer(state, asyncState)
                }
                
            }, onDispose: { [weak stateStore] in
                
                let asyncState: AsyncState<Element, Error> = .cancelled
                
                stateStore?.reduceState { state in
                    return reducer(state, asyncState)
                }
                
            })

    }
    
}
