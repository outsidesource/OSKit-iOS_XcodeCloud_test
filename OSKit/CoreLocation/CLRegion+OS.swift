//
//  CLRegion+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import CoreLocation

public extension CLRegion {
    
    var uuid: UUID? {
        
        return UUID(uuidString: self.identifier)
        
    }
    
    var beaconRegion: CLBeaconRegion? {
        
        guard let uuid = self.uuid else {
            return nil
        }
        
        return CLBeaconRegion(proximityUUID: uuid, identifier: uuid.uuidString)
        
    }
    
}
