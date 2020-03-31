//
//  UIViewLoading.swift
//  CustomerPortal
//
//  Created by Nipun Rajput on 26/12/19.
//  Copyright © 2019 Paymentus. All rights reserved.
//


import Foundation
import UIKit


///Implements a progress HUD. Use the **ViewHudProtocol** to use this class.
final class UIViewProgressHUD: UIView {
    
    private let activityIndicatorView: UIActivityIndicatorView = {
        
        var  indicatorView: UIActivityIndicatorView
        
        if #available(iOS 13.0, *) {
            
            indicatorView = UIActivityIndicatorView(style: .large)
            
        } else {
            
            indicatorView = UIActivityIndicatorView(style: .whiteLarge)
        }
        
        indicatorView.color = UIColor.white
        
        return indicatorView
    }()
        
   
        
    
    private let containerActivityIndicator = UIView.init(frame: CGRect.zero)
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        ///Container Background
        containerActivityIndicator.backgroundColor = UIColor.black
        
        containerActivityIndicator.layer.cornerRadius = 5
        
        if (containerActivityIndicator.superview == nil) {
            
            addSubview(containerActivityIndicator)
            
            containerActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
            
            containerActivityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            
            containerActivityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            
            containerActivityIndicator.widthAnchor.constraint(equalToConstant: 100).isActive = true
            
            containerActivityIndicator.heightAnchor.constraint(equalToConstant: 100).isActive = true
        }
        
        ///Activity Indicator
        if activityIndicatorView.superview == nil {
            
            containerActivityIndicator.addSubview(activityIndicatorView)
            
            activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            
            activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            
            activityIndicatorView.startAnimating()
        }
    }
}

