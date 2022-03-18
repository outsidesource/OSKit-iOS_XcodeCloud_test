//
//  EAAccessoryManager+Device.swift
//  WLA_Redesign
//
//  Created by Brody Robertson on 2/17/22.
//  Copyright © 2022 Bragi. All rights reserved.
//

import ExternalAccessory
import RxSwift

extension Reactive where Base: EAAccessoryManager {
    
    func accessoryDidConnect() -> Observable<EAAccessory> {

        return NotificationCenter.default.rx.notification(.EAAccessoryDidConnect)
            .compactMap { notification in
                return notification.userInfo?["EAAccessoryKey"] as? EAAccessory
            }

    }
    
    func accessoryDidDisconnect() -> Observable<EAAccessory> {

        return NotificationCenter.default.rx.notification(.EAAccessoryDidDisconnect)
            .compactMap { notification in
                return notification.userInfo?["EAAccessoryKey"] as? EAAccessory
            }

    }

}
