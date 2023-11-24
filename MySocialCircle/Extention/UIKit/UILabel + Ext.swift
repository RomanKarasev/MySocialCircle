//
//  UILabel + Ext.swift
//  MyMessage
//
//  Created by Роман Карасёв on 23.11.2023.
//

import UIKit

extension UILabel {
    
    convenience init(text: String,
                     font: UIFont? = .avenir20()) {
        self.init()
        
        self.text = text
        self.font = font
    }
    
}

