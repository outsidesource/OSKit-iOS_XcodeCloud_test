//
//  EAAccessoryManager+Device.swift
//  WLA_Redesign
//
//  Created by Brody Robertson on 2/17/22.
//  Copyright © 2022 Bragi. All rights reserved.
//

import ExternalAccessory
import RxSwift
import RxCocoa

public extension Reactive where Base: EAAccessoryManager {
    
    /// Returns `Observable` of all currently connected `EAAccessory` and `EAAccessory` that connect during subscription
    func connectedAccessories() -> Observable<EAAccessory> {
        
        let connectedAccessories = Observable<EAAccessory>.from(base.connectedAccessories)
        
        return Observable.merge(connectedAccessories, accessoryDidConnect())
        
    }
    
    /// Returns `Observable` of `EAAccessory` that connect during subscription
    func accessoryDidConnect() -> Observable<EAAccessory> {

        return NotificationCenter.default.rx.notification(.EAAccessoryDidConnect)
            .compactMap { notification in
                return notification.userInfo?["EAAccessoryKey"] as? EAAccessory
            }

    }
    
    /// Returns `Observable` of `EAAccessory` that disconnect during subscription
    func accessoryDidDisconnect() -> Observable<EAAccessory> {

        return NotificationCenter.default.rx.notification(.EAAccessoryDidDisconnect)
            .compactMap { notification in
                return notification.userInfo?["EAAccessoryKey"] as? EAAccessory
            }

    }

}
