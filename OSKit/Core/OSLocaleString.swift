//
//  OSLocalizedString.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

public struct OSLocaleString {
    
    // TODO: - 2 UPDATE to use Foundation Locale
    let locale: OSLocale
    let string: String
    
    public init(_ locale: OSLocale, _ string: String) {
        self.locale = locale
        self.string = string
    }
}

extension OSLocaleString: Codable { }
extension OSLocaleString: Equatable { }
