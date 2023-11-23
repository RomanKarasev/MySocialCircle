//
//  UIImage + Ext.swift
//  MyMessage
//
//  Created by Роман Карасёв on 23.11.2023.
//

import UIKit

extension UIImageView {
    
    convenience init(image: UIImage?, 
                     contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }

}