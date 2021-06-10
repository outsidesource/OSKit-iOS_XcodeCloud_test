//
//  UNNotificationSound+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import UserNotifications

public extension UNNotificationSound {
    
    convenience init(name: String) {
        self.init(named: UNNotificationSoundName(rawValue: name))
    }
    
}
