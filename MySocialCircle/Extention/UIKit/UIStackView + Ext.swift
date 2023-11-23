//
//  UIStackView + Ext.swift
//  MyMessage
//
//  Created by Роман Карасёв on 23.11.2023.
//

import UIKit

extension UIStackView {
    
    convenience init(subviews: [UIView],
                     axis: NSLayoutConstraint.Axis,
                     spacing: CGFloat) {
        self.init(arrangedSubviews: subviews)
        
        
        self.axis = axis
        self.spacing = spacing
    }
    
}
