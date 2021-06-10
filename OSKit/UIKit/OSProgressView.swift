//
//  OSProgressView.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2019 Outside Source. All rights reserved.
//

import UIKit

open class OSProgressView: UIView, NibInstantiatable {
    
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    public override var isHidden: Bool {
        didSet {
            if isHidden {
                self.activityIndicator?.stopAnimating()
            } else {
                self.activityIndicator?.startAnimating()
            }
        }
    }
    
    open var progressState: ProgressState? {
        
        didSet {
            
            guard let progressState = progressState else {
                self.descriptionLabel?.text = ""
                return
            }
            
            if let percentDescription = progressState.percentDescription {
                
                self.descriptionLabel?.text = "\(progressState.description)\n\(percentDescription)"
                
            } else if let bytesPercentDescription = progressState.bytesPercentDescription {
                
                self.descriptionLabel?.text = "\(progressState.description)\n\(bytesPercentDescription)"
                
            } else {
                
                self.descriptionLabel?.text = progressState.description
                
            }
            
        }
        
    }
    
}

public protocol OSProgressViewDependent {
    var progressView: OSProgressView { get }
}

extension OSProgressViewDependent where Self: UIViewController {
    
    public var progressView: OSProgressView {
        
        for view in self.view.subviews {
            if let view = view as? OSProgressView, view.tag == .static {
                return view
            }
        }
        
        let progressView = OSProgressView.initWithNib()!
        self.view.addSubview(progressView)
        progressView.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        progressView.centerYAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerYAnchor).isActive = true
        progressView.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        progressView.tag = .static
        return progressView
        
    }
    
}
