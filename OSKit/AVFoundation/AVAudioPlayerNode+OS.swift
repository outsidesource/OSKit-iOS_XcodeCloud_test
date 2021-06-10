//
//  AVAudioPlayerNode+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import AVFoundation

public extension AVAudioPlayerNode {
    
    var currentTime: TimeInterval? {
        
        guard let lastRenderTime = lastRenderTime, let playerTime = playerTime(forNodeTime: lastRenderTime) else {
            return nil
        }
        
        return Double(playerTime.sampleTime) / playerTime.sampleRate
        
    }
    
}
