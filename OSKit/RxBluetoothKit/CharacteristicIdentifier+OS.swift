//
//  CharacteristicIdentifier+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import CoreBluetooth
import RxBluetoothKit

public extension CharacteristicIdentifier where Self: RawRepresentable, Self.RawValue == String {
    
    var uuid: CBUUID {
        return CBUUID(string: self.rawValue)
    }
    
}
