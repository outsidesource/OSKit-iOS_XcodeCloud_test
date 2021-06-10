//
//  OSServiceIdentifier.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import RxBluetoothKit

public enum OSServiceIdentifier: String, ServiceIdentifier {
    
    case gap = "1800"
    case battery = "180F"
    case deviceInformation = "180A"
    case nordicUART = "6E400001-B5A3-F393-E0A9-E50E24DCCA9E"
    
}

public enum OSBatteryCharacteristicIdentifier: String, CharacteristicIdentifier {
    
    case batteryLevel = "2A19"
    
    public var service: ServiceIdentifier {
        return OSServiceIdentifier.battery
    }
    
}

public enum OSDeviceInformationCharacteristicIdentifier: String, CharacteristicIdentifier {
    
    case manufacturerName = "2A29"
    case modelNumber = "2A24"
    case serialNumber = "2A25"
    case hardwareVersion = "2A27"
    case firmwareVersion = "2A26"
    case softwareVersion = "2A28"
    case systemId = "2A23"
    
    public var service: ServiceIdentifier {
        return OSServiceIdentifier.deviceInformation
    }
    
}

public enum NordicUARTCharacteristicIdentifier: String, CharacteristicIdentifier {
    
    case receive = "6E400002-B5A3-F393-E0A9-E50E24DCCA9E"
    case transmit = "6E400003-B5A3-F393-E0A9-E50E24DCCA9E"
    
    public var service: ServiceIdentifier {
        return OSServiceIdentifier.nordicUART
    }
    
}
