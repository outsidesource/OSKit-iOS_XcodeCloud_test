//
//  ProgressState.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

// TODO: - 0 REVIEW semantics aligned to UIProgressView, NSProgress, etc.
public struct ProgressState: Codable, Hashable {
    
    public var description: String
    public var item: UInt?
    public var itemsTotal: UInt?
    public var bytes: UInt?
    public var bytesTotal: UInt?
    public var percent: Float?
    public var timeRemaining: String?
    public var isComplete: Bool = false
    
    public init(description: String) {
        self.description = description
    }
    
    public init(description: String, item: UInt? = nil, itemsTotal: UInt? = nil, bytes: UInt? = nil, bytesTotal: UInt? = nil, percent: Float? = nil, timeRemaining: String? = nil, isComplete: Bool = false) {
        
        self.description = description
        self.item = item
        self.itemsTotal = itemsTotal
        self.bytes = bytes
        self.bytesTotal = bytesTotal
        self.percent = percent
        self.timeRemaining = timeRemaining
        self.isComplete = isComplete
        
    }
    
}

public extension ProgressState {
    
    var percentDescription: String? {
        
        guard var percent = percent else {
            return nil
        }
        
        percent *= 100
        
        return String(format: "%.1f%%", percent)
        
    }
    
    var itemsPercent: Float? {
        
        guard let item = item, let itemsTotal = itemsTotal else {
            return nil
        }
        
        return Float(item) / Float(itemsTotal)
        
    }
    
    var itemsPercentDescription: String? {
        
        guard var itemsPercent = itemsPercent else {
            return nil
        }
        
        itemsPercent *= 100
        
        return String(format: "%.0f%%", itemsPercent)
        
    }
    
    var bytesPercent: Float? {
        
        guard let bytes = bytes, let bytesTotal = bytesTotal else {
            return nil
        }
        
        return Float(bytes) / Float(bytesTotal)
        
    }
    
    var bytesPercentDescription: String? {
        
        guard var bytesPercent = bytesPercent else {
            return nil
        }
        
        bytesPercent *= 100
        
        return String(format: "%.0f%%", bytesPercent)
        
    }
    
}
