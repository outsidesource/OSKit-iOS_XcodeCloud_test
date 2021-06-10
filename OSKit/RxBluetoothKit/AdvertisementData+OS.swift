//
//  AdvertisementData+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2018 Outside Source. All rights reserved.
//

import RxBluetoothKit

public extension AdvertisementData {

    static let manufacturerIdRange = 0..<2
    static let manufacturerUUIDRange = 0..<16
    
    var manufacturerIdData: Data? {
        return self.manufacturerData?[safe: AdvertisementData.manufacturerIdRange]
    }
    
    var manufacturerUUIDData: Data? {
        return self.manufacturerData?[safe: AdvertisementData.manufacturerUUIDRange]
    }
    
    // TODO: - 2 CONSIDER optimization by conditionally casting data to CBUUID and refactoring manufacturerUUIDString
    var manufacturerUUID: UUID? {
        
        guard let manufacturerUUIDString = self.manufacturerUUIDString else {
            return nil
        }
        
        return UUID(uuidString: manufacturerUUIDString)
        
    }
    
    var manufacturerUUIDString: String? {
        return self.manufacturerUUIDData?.base16EncodedString().uuidString
    }
    
}

extension AdvertisementData: Equatable {
    
    public static func == (lhs: AdvertisementData, rhs: AdvertisementData) -> Bool {
        return (lhs.isConnectable == rhs.isConnectable) && (lhs.localName == rhs.localName) && (lhs.manufacturerData == rhs.manufacturerData) && (lhs.serviceData == rhs.serviceData)
    }
    
}
