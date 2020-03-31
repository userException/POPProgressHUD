//
//  ViewHudProtocol.swift
//  CustomerPortal
//
//  Created by Nipun Rajput on 26/12/19.
//  Copyright © 2019 Paymentus. All rights reserved.
//

import Foundation
import UIKit

///Adopt this protocol to show a progress HUD on your UIView or UIView Controller.
protocol ViewHudProtocol {
    
    ///Show the HUD
    func showHUD()
    
    ///Hide the HUD
    func hideHUD()
    
    ///Any arbitrary number used later to find the HUD in subviews
    var loadingViewTag: Int {get}
}


///Default implementation for providing a tag to the HUD
extension ViewHudProtocol {
    
    var loadingViewTag: Int {
        
        //Just a random Int Value. You can change this, if you are using it inside your app.
        get {
            return 5591
        }
    }
}


///Default implementation of **ViewHudProtocol** when adopted from a **UIViewController** type
extension ViewHudProtocol where Self: UIViewController {
    
    ///Call the UIView's showHUD method, so that even if **ViewHudProtocol**  is implemented differently for a UIViewController, it will basically call the UIView's implementation of this method.
    func showHUD() {
    
        self.view.showHUD()
    }

    ///Call the UIView's hideHUD method, so that even if **ViewHudProtocol**  is implemented differently for a UIViewController, it will basically call the UIView's implementation of this method.
    func hideHUD() {
        
        self.view.hideHUD()
    }
}


///Default implementation of **ViewHudProtocol** when adopted from a **UIView** type.
extension ViewHudProtocol where Self: UIView {
    
    ///Create an instance of **UIViewProgressHUD** and add it to the whole view.
    func showHUD() {
        
        if isAlreadyPresent() {
            return 
        }
        
        let loadingView = UIViewProgressHUD.init(frame: self.frame)
        
        self.addSubview(loadingView)
        
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        loadingView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        
        loadingView.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
        
        loadingView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        loadingView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        loadingView.tag = loadingViewTag
    }
    
    ///Finds and hide the **UIViewProgressHUD** after looping through subviews
    func hideHUD() {
        
        guard let hud = self.viewWithTag(loadingViewTag) else {return}
        
        hud.removeFromSuperview()
    }
    
    /// Checks if HUD is already present or not?
    func isAlreadyPresent() -> Bool {
        
        guard self.viewWithTag(loadingViewTag) != nil else {return false}
        
        return true
    }
}


///Extend UIView with **ViewHudProtocol** so that any UIView can show this HUD.
extension UIView: ViewHudProtocol {

}
