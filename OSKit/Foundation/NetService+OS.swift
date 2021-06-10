//
//  NetService+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//


public extension NetService {
    
    var ip: String? {
        
        guard let ipData = txtRecordDictionary?["ip"] else {
            return nil
        }
        
        return String(decoding: ipData, as: UTF8.self)
        
    }
    
    var serial: String? {
        
        guard let serialData = txtRecordDictionary?["serial"] else {
            return nil
        }
        
        return String(decoding: serialData, as: UTF8.self)
        
    }
    
    var txtRecordDictionary: [String: Data]? {
        guard let txtRecordData = self.txtRecordData() else {
            return nil
        }
        return NetService.dictionary(fromTXTRecord: txtRecordData)
    }
    
}
