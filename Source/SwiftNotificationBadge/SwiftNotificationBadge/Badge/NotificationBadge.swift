//
//  NotificationBadge.swift
//  SwiftNotificationBadge
//
//  Created by Manish Rathi on 10/02/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import UIKit

/**
 * The types of Notification Badge (NotificationBadge) that are available.
 * In code, you should use these types. Unfortunately, Interface Builder doesn't support enums yet,
 * so if you configure the Notification Badge in Interface Builder, you have to use the numeric values.
 *
 */
@objc
public enum NotificationBadgeType: Int {
    /// default NotificationBadge: (numerical value: 0)
    case normal
    /// small NotificationBadge: (numerical value: 1)
    case small
}

public let notificationBadgeMaxCount: Int = 9999 //MAX limit of notification badge.
public let defaultNotificationBadgeHeight: CGFloat = 24
public let smallNotificationBadgeHeight: CGFloat = 20
public let notificationBadgeMargin: CGFloat = 8

/**
 *  A NotificationBadge.
 *  In InterfaceBuilder it is possible to create a UIView and give it the class NotificationBadge,
 *  the styling will be done immediately.
 *
 *  @note Use "badgeCount" API to update the notification badge count any-time. @see badgeCount
 *
 */
@IBDesignable
open class NotificationBadge: UILabel {
    
    /**
     * NotificationBadge Text Color.
     *
     * Default value is UIColor.white.
     *
     */
    @IBInspectable
    open var badgeTextColor = UIColor.white {
        didSet {
            configureTheme()
        }
    }
    
    /**
     * NotificationBadge Background Color.
     *
     * Default value is UIColor.red.
     *
     */
    @IBInspectable
    open var badgeBackgroundColor = UIColor.red {
        didSet {
            configureTheme()
        }
    }
    
    // swiftlint:disable valid_ibinspectable
    /**
     * Type of badge.
     *
     * Default value is NotificationBadgeType.default.
     *
     */
    @IBInspectable
    open var badgeType: NotificationBadgeType = .normal {
        didSet {
            configureBadge()
        }
    }
    // swiftlint:enable valid_ibinspectable
    
    /**
     * Use this API to update the badge-count anytime.
     *
     * Default value is 0.
     *
     */
    @IBInspectable
    open var badgeCount: Int = 0 {
        didSet {
            text = badgeCount > notificationBadgeMaxCount ? (String(notificationBadgeMaxCount) + "+") : String(badgeCount)
            badge?.text = text
        }
    }
    
    override open var text: String? {
        didSet {
            configureBadge()
        }
    }
    
    override open var intrinsicContentSize: CGSize {
        return CGSize(width: badgeWidth, height: badgeHeight)
    }
    
    ///Internal Variables
    var backgroundView: UIView?
    var badge: UILabel?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        instanceInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        instanceInit()
    }
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        instanceInit()
    }
    
    private func instanceInit() {
        configureViews()
        configureBadge()
        configureTheme()
    }
}
