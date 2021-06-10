//
//  AVAudioFile+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import AVFoundation

public extension AVAudioFile {

    var duration: TimeInterval {
        return Double(length) / processingFormat.sampleRate
    }

}
