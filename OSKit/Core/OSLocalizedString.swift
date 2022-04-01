//
//  OSLocalizedStringCollection.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//


public struct OSLocalizedString {
    
    public let localizedStrings: [OSLocaleString]
    
    public init(_ localizedStrings: [OSLocaleString]) {
        self.localizedStrings = localizedStrings
    }
    
    private var locales: [OSLocale] {
        return self.localizedStrings
            .map { $0.locale }
    }
    
    private var localeStrings: [String] {
        return self.locales
            .map { $0.rawValue }
    }
    
    private var preferredLocale: OSLocale {
        
        /// We are implicitly unwrapping this because we know we are supplying at least one OSLocale string which will be preferred
        let localeString = Bundle.preferredLocalizations(from: localeStrings).first!
        return OSLocale(rawValue: localeString)!
        
    }
    
}

extension OSLocalizedString: Codable { }
extension OSLocalizedString: Equatable { }

extension OSLocalizedString: CustomStringConvertible {
    
    public var description: String {
        
        /// We are implicitly unwrapping because we know localizedStrings will contain an instance with preferred locale
        let localizedString = self.localizedStrings.first { localizedString -> Bool in
            return localizedString.locale == preferredLocale
        }!
        
        return localizedString.string
        
    }
    
}
