//
//  String+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2018 Outside Source. All rights reserved.
//


public extension String {
    
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    var uuidString: String? {
        
        guard self.count == 32 else {
            return nil
        }
        
        let startIndex = self.startIndex
        let sectionIndex1 = self.index(startIndex, offsetBy: 8)
        let sectionIndex2 = self.index(sectionIndex1, offsetBy: 4)
        let sectionIndex3 = self.index(sectionIndex2, offsetBy: 4)
        let sectionIndex4 = self.index(sectionIndex3, offsetBy: 4)
        let endIndex = self.endIndex
        
        let uuidString = "\(self[..<sectionIndex1])-\(self[sectionIndex1..<sectionIndex2])-\(self[sectionIndex2..<sectionIndex3])-\(self[sectionIndex3..<sectionIndex4])-\(self[sectionIndex4..<endIndex])"
        return uuidString
        
    }
    
    var dateFromUTCDateString: Date? {
        
        // Format date in UTC
        // UTC Date:  2019-01-10T20:07:51.369Z
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        return dateFormatter.date(from: self)
        
    }
    
    /// Adds a separator at every N characters
    /// - stride: the number of characters in the group, before a separator is inserted
    /// - separator: the String value to be inserted, to separate the groups
    func separated(with separator: String = " ", atEvery stride: Int = 1) -> String {
        return String(enumerated().map { $0.isMultiple(of: stride) ? "\(separator)\($1)" : String($1) }.joined().dropFirst())
    }

}
