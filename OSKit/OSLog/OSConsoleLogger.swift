//
//  OSConsoleLogger.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//


public class OSConsoleLogger: ILogger {
    
    public init() { }
    
    public func verbose(_ message: String, _ file: String, _ function: String, _ line: Int) {
        
        let message = OSConsoleLogger.formatMessage(message, file, function, line, .verbose)
        print(message)
        
    }
    
    public func debug(_ message: String, _ file: String, _ function: String, _ line: Int) {
        
        let message = OSConsoleLogger.formatMessage(message, file, function, line, .debug)
        print(message)
        
    }
        
    public func info(_ message: String, _ file: String, _ function: String, _ line: Int) {
        
        let message = OSConsoleLogger.formatMessage(message, file, function, line, .info)
        print(message)
        
    }
    
    public func warn(_ message: String, _ file: String, _ function: String, _ line: Int) {
        
        let message = OSConsoleLogger.formatMessage(message, file, function, line, .warn)
        print(message)
        
    }
    
    public func error(_ message: String, _ file: String, _ function: String, _ line: Int) {
        
        let message = OSConsoleLogger.formatMessage(message, file, function, line, .error)
        print(message)
        
    }
    
    open class func formatMessage(_ message: String, _ file: String, _ function: String, _ line: Int, _ level: OSLog.Level) -> String {
        
        return "\(OSLogTimestamp.timestamp): \(level.description): \(self.fileNameWithoutSuffix(file)).\(function): \(message)"
        
    }
    
    open class func fileNameWithoutSuffix(_ file: String) -> String {
        
        var fileURL = URL(fileURLWithPath: file)
        fileURL.deletePathExtension()
        return fileURL.lastPathComponent
        
    }
    
}

class OSLogTimestamp {
    
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return formatter
    }()

    static var timestamp: String {
        dateFormatter.string(from: Date())
    }
    
}
