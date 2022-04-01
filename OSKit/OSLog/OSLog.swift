//
//  OSLog.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

public class OSLog {
    
    public static let shared = OSLog()
    
    private var loggerContexts: [LoggerContext] = []
    
    public static func addLogger(_ logger: ILogger, level: Level, domains: [Domain]) {
        shared.addLogger(logger, level: level, domains: domains)
    }
    
    public func addLogger(_ logger: ILogger, level: Level, domains: [Domain]) {
        addLoggerContext(LoggerContext(logger: logger, level: level, domains: domains))
    }
    
    public static func addLoggerContext(_ loggerContext: LoggerContext) {
        shared.addLoggerContext(loggerContext)
    }
    
    public func addLoggerContext(_ loggerContext: LoggerContext) {
        loggerContexts.append(loggerContext)
    }
    
    private func isLoggerContextEnabled(_ loggerContext: LoggerContext, domains: [Domain], level: Level) -> Bool {
        
        return level.rawValue >= loggerContext.level.rawValue && (loggerContext.domains.contains(.all) || loggerContext.domains.containsAny(domains))
        
    }
    
    // MARK: - Verbose
    
    public static func verbose(_ message: @autoclosure () -> Any = "", domain: Domain = .default, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        shared.verbose(message(), domains: [domain], file, function, line)
        
    }
    
    public static func verbose(_ message: @autoclosure () -> Any = "", domains: [Domain], _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        shared.verbose(message(), domains: domains, file, function, line)
        
    }
    
    public func verbose(_ message: @autoclosure () -> Any = "", domain: Domain = .default, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        self.verbose(message(), domains: [domain], file, function, line)
        
    }
    
    public func verbose(_ message: @autoclosure () -> Any = "", domains: [Domain], _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        loggerContexts.forEach {
            if isLoggerContextEnabled($0, domains: domains, level: .verbose) {
                $0.logger.verbose(String(describing: message()), file, function, line)
            }
        }
        
    }
    
    // MARK: - Debug
    
    public static func debug(_ message: @autoclosure () -> Any = "", domain: Domain = .default, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        shared.debug(message(), domains: [domain], file, function, line)
        
    }
    
    public static func debug(_ message: @autoclosure () -> Any = "", domains: [Domain], _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        shared.debug(message(), domains: domains, file, function, line)
        
    }
    
    public func debug(_ message: @autoclosure () -> Any = "", domain: Domain = .default, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        self.debug(message(), domains: [domain], file, function, line)
        
    }
    
    public func debug(_ message: @autoclosure () -> Any = "", domains: [Domain], _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        loggerContexts.forEach {
            if isLoggerContextEnabled($0, domains: domains, level: .debug) {
                $0.logger.debug(String(describing: message()), file, function, line)
            }
        }
        
    }

    // MARK: - Info
    
    public static func info(_ message: @autoclosure () -> Any = "", domain: Domain = .default, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        shared.info(message(), domains: [domain], file, function, line)
        
    }
    
    public static func info(_ message: @autoclosure () -> Any = "", domains: [Domain], _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        shared.info(message(), domains: domains, file, function, line)
        
    }
    
    public func info(_ message: @autoclosure () -> Any = "", domain: Domain = .default, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        self.info(message(), domains: [domain], file, function, line)
        
    }
    
    public func info(_ message: @autoclosure () -> Any = "", domains: [Domain], _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        loggerContexts.forEach {
            if isLoggerContextEnabled($0, domains: domains, level: .info) {
                $0.logger.info(String(describing: message()), file, function, line)
            }
        }
        
    }
    
    // MARK: - Warn
    
    public static func warn(_ message: @autoclosure () -> Any = "", domain: Domain = .default, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        shared.warn(message(), domains: [domain], file, function, line)

    }
    
    public static func warn(_ message: @autoclosure () -> Any = "", domains: [Domain], _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        shared.warn(message(), domains: domains, file, function, line)

    }
    
    public func warn(_ message: @autoclosure () -> Any = "", domain: Domain = .default, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        self.warn(message(), domains: [domain], file, function, line)

    }
    
    public func warn(_ message: @autoclosure () -> Any = "", domains: [Domain], _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        loggerContexts.forEach {
            if isLoggerContextEnabled($0, domains: domains, level: .warn) {
                $0.logger.warn(String(describing: message()), file, function, line)
            }
        }

    }
    
    // MARK: - Error
    
    public static func error(_ message: @autoclosure () -> Any = "", domain: Domain = .default, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        shared.error(message(), domains: [domain], file, function, line)
        
    }
    
    public static func error(_ message: @autoclosure () -> Any = "", domains: [Domain], _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        shared.error(message(), domains: domains, file, function, line)
        
    }
    
    public func error(_ message: @autoclosure () -> Any = "", domain: Domain = .default, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        self.error(message(), domains: [domain], file, function, line)
        
    }
    
    public func error(_ message: @autoclosure () -> Any = "", domains: [Domain], _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        loggerContexts.forEach {
            if isLoggerContextEnabled($0, domains: domains, level: .error) {
                $0.logger.error(String(describing: message()), file, function, line)
            }
        }
        
    }
    
}

public extension OSLog {

    struct Domain: ExpressibleByStringLiteral, Equatable {
        
        public let rawValue: String
        public init(stringLiteral: String) {
            self.rawValue = stringLiteral
        }
        
    }
    
}

public extension OSLog.Domain {
    
    // OSLog domains
    static let `default` = OSLog.Domain("default")
    static let all = OSLog.Domain("all")
    
    // Configuration
    static let debug = OSLog.Domain("debug")
    static let production = OSLog.Domain("production")
    
}

public extension OSLog {

    enum Level: Int, CustomStringConvertible {
        
        case verbose
        case debug
        case info
        case warn
        case error
        
        public var description: String {
            
            switch self {
            case .verbose:
                return "v"
                
            case .debug:
                return "d"
                
            case .info:
                return "i"
                
            case .warn:
                return "w"
                
            case .error:
                return "e"
                
            }
        }
        
    }
    
}

public extension OSLog {
    
    struct LoggerContext {
        let logger: ILogger
        let level: Level
        // TODO: - 1 CONSIDER using Set for optimization to checking domain enablement
        let domains: [Domain]
    }
    
}
