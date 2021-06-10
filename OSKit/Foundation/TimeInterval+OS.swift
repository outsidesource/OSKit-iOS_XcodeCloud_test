//
//  TimeInterval+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

public extension TimeInterval {
  
    private static let minutesSecondsDateFormatter: DateComponentsFormatter = {

       let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        formatter.unitsStyle = .positional
        return formatter

    }()

    /// Return description of self in minutes, and seconds in positional format
    /// - Ex. 02:03
    var minutesSecondsDescription: String? {
        return TimeInterval.minutesSecondsDateFormatter.string(from: self)
    }
    
    var milliseconds: Double {
        return self * 1000
    }
    
}
