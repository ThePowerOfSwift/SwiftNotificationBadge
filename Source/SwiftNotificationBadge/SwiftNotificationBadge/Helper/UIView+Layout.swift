//
//  UIView+Layout.swift
//  SwiftNotificationBadge
//
//  Created by Manish Rathi on 10/02/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import UIKit

public extension UIView {
    
    /// Create UIView instance with translatesAutoresizingMaskIntoConstraints as false.
    public class func makePreparedForAutoLayout() -> Self {
        let view = self.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    /// Remove AutoLayout constraints from UIView's subviews.
    public func removeConstraintsOfSubviews() {
        for view in subviews {
            view.removeConstraints(view.constraints)
        }
    }
    
    /// Add AutoLayout constraints withVisualFormat Strings.
    public func addConstraints(_ visualStringConstraints: [String],
                               metrics: [String : Any]?,
                               views: [String : Any]) {
        for visualFormat in visualStringConstraints {
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: visualFormat,
                                                          options: [],
                                                          metrics: metrics,
                                                          views: views))
        }
    }
}
