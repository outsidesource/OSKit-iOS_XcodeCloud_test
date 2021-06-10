//
//  OSFile.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

public struct OSFile: Equatable {
    public let title: String
    public let filename: String
    
    public init(title: String, filename: String) {
        self.title = title
        self.filename = filename
    }
}
