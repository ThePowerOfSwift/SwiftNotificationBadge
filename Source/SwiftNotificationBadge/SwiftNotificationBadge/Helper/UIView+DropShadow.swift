//
//  UIView+DropShadow.swift
//  SwiftNotificationBadge
//
//  Created by Manish Rathi on 10/02/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import UIKit

public extension UIView {
    
    /// Applies drop shadow to the UIView
    /// Sets the drop shadow to the CALayer of the view.
    ///
    /// - Important:
    /// If the property clipToBounds == true, the shadow will not be visible.
    ///
    public func applyDropShadow() {
        layer.shadowRadius = 1.0
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1.0
    }
    
    /// Remove drop shadow to the UIView
    public func removeDropShadow() {
        layer.shadowOpacity = 0.0
    }
}
