//
//  FileManager+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2018 Outside Source. All rights reserved.
//


public extension FileManager {
    
    class var documentsDirectoryPath: String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, false).first!
    }
    
    class var libraryDirectoryPath: String {
        return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, false).first!
    }
    
    class var cachesDirectoryPath: String {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, false).first!
    }
    
    class var documentsDirectoryURL: URL {
        return self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    class var libraryDirectoryURL: URL {
        return self.default.urls(for: .libraryDirectory, in: .userDomainMask).first!
    }
    
    class var cachesDirectoryURL: URL {
        return self.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    }
    
}

public extension String {
    
    var expandingTildeInPath: String {
        return NSString(string: self).expandingTildeInPath
    }
    
}
