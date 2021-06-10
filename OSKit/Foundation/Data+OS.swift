//
//  Data+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2018 Outside Source. All rights reserved.
//

import CommonCrypto

public protocol DataConvertible {
    init?(data: Data)
    var data: Data { get }
}

public extension DataConvertible {
    
    init?(data: Data) {
        guard data.count == MemoryLayout<Self>.size else { return nil }
        self = data.withUnsafeBytes { pointer in
            pointer.load(as: Self.self)
        }
    }
    
    var data: Data {
        return withUnsafeBytes(of: self) { Data($0) }
    }
}

extension Int: DataConvertible { }
extension Int8: DataConvertible { }
extension Int16: DataConvertible { }
extension Int32: DataConvertible { }
extension Int64: DataConvertible { }
extension UInt: DataConvertible { }
extension UInt8: DataConvertible { }
extension UInt16: DataConvertible { }
extension UInt32: DataConvertible { }
extension UInt64: DataConvertible { }
extension Float: DataConvertible { }
extension Double: DataConvertible { }

public extension Data {
    
    init<T>(from value: T) {
        self = Swift.withUnsafeBytes(of: value) { Data($0) }
    }
    
    func to<T>(type: T.Type) -> T {
        // FIXME: - DEPRECATION WARNING https://stackoverflow.com/questions/38023838/round-trip-swift-number-types-to-from-data
        return self.withUnsafeBytes { $0.pointee }
    }
    
    init<T>(fromArray values: [T]) {
        self = values.withUnsafeBytes { Data($0) }
    }
    
    func toArray<T>(type: T.Type) -> [T] {
        return self.withUnsafeBytes {
            // FIXME: - DEPRECATION WARNING https://stackoverflow.com/questions/38023838/round-trip-swift-number-types-to-from-data
            [T](UnsafeBufferPointer(start: $0, count: self.count/MemoryLayout<T>.stride))
        }
        
    }
    
    struct Base16EncodingOptions: OptionSet {
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        public let rawValue: Int
        static let upperCase = Base16EncodingOptions(rawValue: 1 << 0)
        
    }
    
    func base16EncodedString(options: Base16EncodingOptions = []) -> String {
        
        // this is elegant but unperformant
        // return data.map { String(format: "%02hhx", $0) }.joined()
        
        // this is 120x faster
        let hexDigits = Array((options.contains(.upperCase) ? "0123456789ABCDEF" : "0123456789abcdef").utf16)
        var chars: [unichar] = []
        chars.reserveCapacity(2 * count)
        for byte in self {
            chars.append(hexDigits[Int(byte / 16)])
            chars.append(hexDigits[Int(byte % 16)])
        }
        return String(utf16CodeUnits: chars, count: chars.count)
    }
    
    subscript (safe range: Range<Data.Index>) -> Data? {
        return subdata(safe: range)
    }
    
    func subdata(safe range: Range<Data.Index>) -> Data? {
        
        guard self.contains(range) else {
            return nil
        }
        
        return self.subdata(in: range)
        
    }
    
    func contains(_ range: Range<Data.Index>) -> Bool {
        return self.count >= range.upperBound
    }
    
    var sha1: String {
        
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        self.withUnsafeBytes {
            _ = CC_SHA1($0.baseAddress, CC_LONG(self.count), &digest)
        }
        
        let hexBytes = digest.map { String(format: "%02hhx", $0) }
        return hexBytes.joined()
        
    }
    
    var truncateEmptyData: Data {
        
        for i in 0..<self.count {
            
            if self[i] == 0 {
                return self.subdata(in: 0..<i)
            }
        }
        
        return self
        
    }
    
}
