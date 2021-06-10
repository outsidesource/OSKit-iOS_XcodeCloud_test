//
//  OSDeviceInformation.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

public struct OSDeviceInformation: Codable, Equatable {
    
    public var manufacturerName: String?
    public var modelNumber: String?
    public var serialNumber: String?
    public var hardwareVersion: OSVersion?
    public var firmwareVersion: OSVersion?
    public var softwareVersion: OSVersion?
    public var systemId: Data?
    
    public init(manufacturerName: String? = nil, modelNumber: String? = nil, serialNumber: String? = nil, hardwareVersion: OSVersion? = nil, firmwareVersion: OSVersion? = nil, softwareVersion: OSVersion? = nil, systemId: Data? = nil) {
        
        self.manufacturerName = manufacturerName
        self.modelNumber = modelNumber
        self.serialNumber = serialNumber
        self.hardwareVersion = hardwareVersion
        self.firmwareVersion = firmwareVersion
        self.softwareVersion = softwareVersion
        self.systemId = systemId
        
    }
    
}
