//
//  UIImage+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import UIKit

public extension UIImage {
    
    static func color(_ color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        color.setFill()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
        
    }
    
    /// Create a copy of an Asset catalog resource so we can reference it by URL, this can be used for UNUserNotifications
    static func url(name: String) -> URL? {
    
        guard let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        // We have hard coded png sinc we are hard coding saving the data in png
        let url = cacheDirectory.appendingPathComponent("\(name).png")
        
        guard FileManager.default.fileExists(atPath: url.path) else {
            
            guard let image = UIImage(named: name) else {
                return nil
            }
            
            FileManager.default.createFile(atPath: url.path, contents: image.pngData(), attributes: nil)
            return url
            
        }
        
        return url
    }
    
}
