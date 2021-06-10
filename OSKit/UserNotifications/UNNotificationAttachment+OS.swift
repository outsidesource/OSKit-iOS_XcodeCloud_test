//
//  UNNotificationAttachment+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import UIKit
import CoreGraphics
import UserNotifications

public extension UNNotificationAttachment {
    
    static func image(identifier: String, imageName: String) -> UNNotificationAttachment? {
        
        guard let url = UIImage.url(name: imageName) else {
            return nil
        }
        
        return image(identifier: identifier, url: url)
        
    }
    
    static func image(identifier: String, url: URL) -> UNNotificationAttachment? {
        
        return try? UNNotificationAttachment(identifier: identifier, url: url, options: [UNNotificationAttachmentOptionsThumbnailClippingRectKey: CGRect(x: 0, y: 0, width: 1, height: 1).dictionaryRepresentation])
        
    }
    
}
