//
//  NotificationBadge+Configuration.swift
//  SwiftNotificationBadge
//
//  Created by Manish Rathi on 10/02/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import UIKit

extension NotificationBadge {
    func configureViews() {
        (backgroundView, badge) = (UIView.makePreparedForAutoLayout(), UILabel.makePreparedForAutoLayout())
        if let backgroundView = backgroundView, let badge = badge {
            badge.textAlignment = .center
            badge.baselineAdjustment = .alignCenters
            configureAutolayoutConstraints(parentView: self, childView: backgroundView)
            configureAutolayoutConstraints(parentView: backgroundView, childView: badge)
            backgroundView.applyDropShadow()
        }
    }
    
    func configureAutolayoutConstraints(parentView: UIView, childView: UIView) {
        parentView.addSubview(childView)
        let views: [String: UIView] = ["childView": childView]
        var visualFormatConstraints = [String]()
        visualFormatConstraints.append("H:|[childView]|")
        visualFormatConstraints.append("V:|[childView]|")
        parentView.addConstraints(visualFormatConstraints, metrics: nil, views: views)
    }
    
    func configureBadge() {
        isHidden = badgeCount < 1
        font = UIFont.systemFont(ofSize: badgeType.fontSize)
        badge?.font = font
        badge?.textAlignment = .center
        badge?.baselineAdjustment = .alignCenters
        backgroundView?.layer.cornerRadius = badgeType.fontSize
        badge?.layer.cornerRadius = badgeType.fontSize
        invalidateIntrinsicContentSize()
    }
    
    func configureTheme() {
        backgroundColor = .clear
        badge?.textColor = badgeTextColor
        backgroundView?.backgroundColor = badgeBackgroundColor
    }
    
    var badgeWidth: CGFloat {
        return width > badgeHeight ? width : badgeHeight
    }
    
    var badgeHeight: CGFloat {
        return badgeType.height
    }
}


extension NotificationBadgeType {
    var height: CGFloat {
        return self == .normal ? defaultNotificationBadgeHeight : smallNotificationBadgeHeight
    }
    
    var fontSize: CGFloat {
        return height / 2
    }
}


extension UILabel {
    var width: CGFloat {
        let labelSize = sizeToFit(CGSize(width: CGFloat.greatestFiniteMagnitude,
                                         height: defaultNotificationBadgeHeight))
        return labelSize.width + notificationBadgeMargin
    }
}
