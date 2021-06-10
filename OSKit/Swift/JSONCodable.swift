//
//  JSONCodable.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//


public typealias JSONCodable = JSONEncodable & JSONDecodable

public protocol JSONEncodable: Encodable {
    
    var data: Data? { get }
    var rawString: String? { get }
    
}

public extension JSONEncodable {
    
    var data: Data? {
        
        let encoder = JSONEncoder()
        let data = try? encoder.encode(self)
        return data
        
    }
    
    var rawString: String? {
        
        guard let data = self.data else {
            return nil
        }
        
        let jsonString = String(data: data, encoding: .utf8)
        return jsonString
        
    }
    
    var dictionary: [String: Any]? {
      guard let data = try? JSONEncoder().encode(self) else { return nil }
      return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}

public protocol JSONDecodable: Decodable {
    
    static func decode(data: Data) -> Self?
    static func decodeArray(data: Data) -> [Self]?
    
}

public extension JSONDecodable {
    
    static func decode(data: Data) -> Self? {
        
        let decoder = JSONDecoder()
        
        do {
            
            let instance = try decoder.decode(Self.self, from: data)
            return instance
            
        } catch {
            
        }
        
        return nil
        
    }
    
    static func decodeArray(data: Data) -> [Self]? {
        let decoder = JSONDecoder()

        do {

            let instance = try decoder.decode([Self].self, from: data)
            return instance

        } catch {
            
        }

        return nil
    }

}

extension Array: JSONCodable where Element: JSONCodable { }
