//
//  UILabel+Size.swift
//  SwiftNotificationBadge
//
//  Created by Manish Rathi on 10/02/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import UIKit

/*
 *************************************************************
 How to Use "sizeToFit(_ size: CGSize)" API
 *************************************************************
 
 Suppose User want to know about the height of its text with fixed width.
 Then
 Use this api as below:
 
 let label = ....
 let labelWidth = label.frame.size.width
 let inputSize = CGSize(width: labelWidth, height: CGFloat.greatestFiniteMagnitude)
 let labelSize = label.sizeToFit(inputSize)
 
 Use label Height as: labelSize.height
 */
public extension UILabel {
    public func sizeToFit(_ size: CGSize) -> CGSize {
        return text?.sizeToFit(size, font: font) ?? CGSize.zero
    }
}


//≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠ Label Size ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
protocol LabelSize {
    var attributedText: NSAttributedString? { get }
    var text: String? { get }
    func sizeToFitting(_ size: CGSize, font: UIFont?, lineBreakMode: NSLineBreakMode) -> CGSize
}

extension LabelSize {
    func sizeToFitting(_ size: CGSize, font: UIFont?, lineBreakMode: NSLineBreakMode) -> CGSize {
        let label = UILabel()
        label.frame.origin = CGPoint.zero
        label.frame.size = size
        label.numberOfLines = 0
        label.lineBreakMode = lineBreakMode
        label.font = font
        label.attributedText = attributedText
        label.sizeToFit()
        return label.frame.size
    }
    
    var attributedText: NSAttributedString? { return nil }
    
    var text: String? { return nil }
}


//≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠ Confirm LabelSize Protocol ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
extension String: LabelSize {
    var text: String? {
        return self
    }
    
    var attributedText: NSAttributedString? {
        return NSAttributedString(string: self)
    }
    
    fileprivate func sizeToFit(_ size: CGSize, font: UIFont?, lineBreakMode: NSLineBreakMode = .byWordWrapping) -> CGSize {
        return sizeToFitting(size, font: font, lineBreakMode: lineBreakMode)
    }
}
