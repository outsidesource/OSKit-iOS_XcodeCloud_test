//
//  Date+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//


public extension Date {
    
    static func dateFromComponents(_ dateComponents: DateComponents) -> Date? {
        
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)
        return date
        
    }
    
    var isToday: Bool {
        return dateDescription == Date().dateDescription
    }
    
    var utcDateString: String {
        
        // Format date in UTC
        // UTC Date:  2019-01-10T20:07:51.369Z
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let utcDate = dateFormatter.string(from: self)
        return utcDate
        
    }
    
    var localDateString: String {
        
        // Format date in current time zone
        // dateFormatter.timeZone = TimeZone.current
        // Local Date: 2019-01-10T14:07:51.369Z
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let localDate = dateFormatter.string(from: self)
        return localDate
        
    }
    
    var timeZone: String {
        
        // Get timezone abbreviation for current time zone
        //dateFormatter.timeZone = TimeZone.current
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "xxxxx"
        let timeZone = dateFormatter.string(from: self)
        return timeZone
        
    }
    
    /// Ex. 1:00 AM
    var timeDescription: String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: self)
        
    }
    
    /// Ex. Mon, Tue...
    var shortDayDescription: String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "E"
        let localDate = dateFormatter.string(from: self)
        return localDate
        
    }
    
    /// Ex. Monday, Tuesday...
    var dayDescription: String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "EEEE"
        let localDate = dateFormatter.string(from: self)
        return localDate
        
    }
    
    /// Ex. 01-01-19
    var dateDescription: String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "MM-dd-YY"
        let localDate = dateFormatter.string(from: self)
        return localDate
        
    }
    
    var hour: Int {
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        return hour
        
    }
    
    var minute: Int {
        
        let calendar = Calendar.current
        let hour = calendar.component(.minute, from: self)
        return hour
        
    }
    
    var components: DateComponents {
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.calendar, .day, .era, .hour, .minute, .month, .nanosecond, .quarter, .second, .timeZone, .weekday, .weekdayOrdinal, .weekOfMonth, .weekOfYear, .year, .yearForWeekOfYear], from: self)
        return components
        
    }
    
}
