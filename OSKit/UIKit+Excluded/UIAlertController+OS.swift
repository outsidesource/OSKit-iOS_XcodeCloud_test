//
//  UIAlertController+OS.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import UIKit

public typealias UIAlertActionHandler = ((UIAlertAction) -> ())

public extension UIAlertController {
    
    static func successOkAlertController(message: String, handler: UIAlertActionHandler? = nil) -> UIAlertController {
        
        let title = NSLocalizedString("Success", comment: "")
        let okTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = self.alertController(title: title, message: message, actionTitles: [okTitle], handlers: [handler])
        
        return alertController
        
    }
    
    static func errorOkAlertController(error: Error, handler: UIAlertActionHandler? = nil) -> UIAlertController {
        
        let title = NSLocalizedString("Error", comment: "")
        let message = error.localizedDescription
        let okTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = self.alertController(title: title, message: message, actionTitles: [okTitle], handlers: [handler])
        
        return alertController
        
    }
    
    static func errorCancelRetryAlertController(error: Error, cancelHandler: UIAlertActionHandler? = nil, retryHandler: UIAlertActionHandler? = nil) -> UIAlertController {
        
        let title = NSLocalizedString("Error", comment: "")
        let message = error.localizedDescription
        let cancelTitle = NSLocalizedString("Cancel", comment: "")
        let retryTitle = NSLocalizedString("Retry", comment: "")
        
        let alertController = self.alertController(title: title, message: message, actionTitles: [cancelTitle, retryTitle], handlers: [cancelHandler, retryHandler])
        
        return alertController
        
    }
    
    static func errorRetryAlertController(error: Error, handler: @escaping UIAlertActionHandler) -> UIAlertController {
        
        let title = NSLocalizedString("Error", comment: "")
        let message = error.localizedDescription
        let retryTitle = NSLocalizedString("Retry", comment: "")
        
        let alertController = self.alertController(title: title, message: message, actionTitles: [retryTitle], handlers: [handler])
        
        return alertController
        
    }
    
    static func alertController(title: String, message: String, actionTitles: [String], handlers: [UIAlertActionHandler?]) -> UIAlertController {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for (i, actionTitle) in actionTitles.enumerated() {
            
            if let handler = handlers[safe: i] {
                
                /// completionBlock is optional
                let alertAction = UIAlertAction(title: actionTitle, style: .default, handler: handler)
                alertController.addAction(alertAction)
                
            } else {
                
                let alertAction = UIAlertAction(title: actionTitle, style: .default, handler: nil)
                alertController.addAction(alertAction)
                
            }
            
        }
        
        return alertController
        
    }
    
}
