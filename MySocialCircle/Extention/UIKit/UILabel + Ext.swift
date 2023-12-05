//
//  UILabel + Ext.swift
//  MyMessage
//
//  Created by Роман Карасёв on 23.11.2023.
//

import UIKit

extension UILabel {
    
    convenience init(text: String,
                     font: UIFont? = .openSansReg20()) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = #colorLiteral(red: 0.3333333333, green: 0.4117647059, blue: 0.4392156863, alpha: 1)
    }
    
}

