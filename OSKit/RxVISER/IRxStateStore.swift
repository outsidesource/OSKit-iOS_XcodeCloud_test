//
//  IRxStateStore.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import RxSwift

public protocol IRxStateStore {
    func getStateObservable(_ id: String) -> Observable<IState?>
}
