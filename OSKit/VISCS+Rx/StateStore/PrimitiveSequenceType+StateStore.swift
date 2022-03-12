//
//  PrimitiveSequenceType+StateStore.swift
//  OSKit
//
//  Created by Brody Robertson on 3/11/22.
//

import RxSwift

public extension PrimitiveSequenceType where Trait == CompletableTrait, Element == Swift.Never {
    
    func reduceState<StateType: IState>(_ stateStore: StateStore<StateType>, reducer: @escaping (StateType?, AsyncState<(), Error>) -> (StateType?)) -> PrimitiveSequence<Trait, Element> {

        return self
            .do { [weak stateStore] error in
                
                let asyncState: AsyncState<(), Error> = .error(error)
                
                stateStore?.reduceState { state in
                    return reducer(state, asyncState)
                }
                
            } onCompleted: { [weak stateStore] in
                
                let asyncState: AsyncState<(), Error> = .complete()
                
                stateStore?.reduceState { state in
                    return reducer(state, asyncState)
                }
                
            } onSubscribe: { [weak stateStore] in
                
                let asyncState: AsyncState<(), Error> = .idle
                
                stateStore?.reduceState { state in
                    return reducer(state, asyncState)
                }
                
            } onSubscribed: { [weak stateStore] in
                
                let asyncState: AsyncState<(), Error> = .busy
                
                stateStore?.reduceState { state in
                    return reducer(state, asyncState)
                }
                
            } onDispose: { [weak stateStore] in
                
                let asyncState: AsyncState<(), Error> = .cancelled
                
                stateStore?.reduceState { state in
                    return reducer(state, asyncState)
                }
                
            }

    }
    
}

public extension PrimitiveSequenceType where Trait == SingleTrait {

    func reduceState<StateType: IState>(_ stateStore: StateStore<StateType>, reducer: @escaping (StateType?, AsyncState<Element, Error>) -> (StateType?)) -> PrimitiveSequence<Trait, Element> {

        return self
            .do(onSuccess: { [weak stateStore] element in
                
                let asyncState: AsyncState<Element, Error> = .complete(element)
                
                stateStore?.reduceState { state in
                    return reducer(state, asyncState)
                }
                
            }, onError: { [weak stateStore] error in
                
                let asyncState: AsyncState<Element, Error> = .error(error)
                
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
