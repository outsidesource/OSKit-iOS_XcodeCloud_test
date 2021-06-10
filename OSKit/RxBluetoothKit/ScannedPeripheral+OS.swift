//
//  ScannedPeripheral+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2018 Outside Source. All rights reserved.
//

import CoreBluetooth
import RxBluetoothKit

extension ScannedPeripheral: IStringIdentifiable {
    
    /// Returns the iOS peripheral UUID String
    public var id: String {
        self.peripheralUUIDString
    }
    
    /// Returns the iOS peripheral UUID String
    public var peripheralUUIDString: String {
        return self.peripheral.identifier.uuidString
    }
    
    /// Returns the iOS peripheral UUID
    public var peripheralUUID: UUID {
        return self.peripheral.identifier
    }
    
    /// Returns the advertised manufacturer data
    public var manufacturerData: Data? {
        return self.advertisementData.manufacturerData
    }
    
    /// Returns the manufacturer Bluetooth SIG ID contained in advertised manufacturer data
    public var manufacturerIdData: Data? {
        return self.advertisementData.manufacturerIdData
    }
    
    /// Returns the manufacturer UUID Data if the manufacturer data begins with a UUID immediately after the manufacturer Bluetooth SIG ID
    public var manufacturerUUIDData: Data? {
        return self.advertisementData.manufacturerUUIDData
    }
    
    /// Returns the manufacturer UUID if the manufacturer data begins with a UUID immediately after the manufacturer Bluetooth SIG ID
    public var manufacturerUUID: UUID? {
        return self.advertisementData.manufacturerUUID
    }
    
    /// Returns the manufacturer UUID String if the manufacturer data begins with a UUID immediately after the manufacturer Bluetooth SIG ID
    public var manufacturerUUIDString: String? {
        return self.advertisementData.manufacturerUUIDString
    }
    
    public var localName: String? {
        self.advertisementData.localName
    }
        
}

extension ScannedPeripheral: Equatable {
    
    public static func == (lhs: ScannedPeripheral, rhs: ScannedPeripheral) -> Bool {
        return lhs.id == rhs.id && lhs.advertisementData == rhs.advertisementData
    }
    
}

extension ScannedPeripheral: CustomStringConvertible {
    
    public var description: String {
        
        return ("uuid: \(self.peripheral.identifier), isConnected: \(self.peripheral.isConnected), \nperipheral.rssi: \(self.rssi), state: \(self.peripheral.state.rawValue), advertisementData: \(self.advertisementData)")
        
    }
    
}
