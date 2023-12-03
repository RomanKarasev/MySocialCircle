//
//  ProfileView.swift
//  MySocialCircle
//
//  Created by Роман Карасёв on 03.12.2023.
//

import UIKit

class ProfileView: BaseProfileAndChatRequestView {
 
    let myTextField = InsertableTextField()
    
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        constomizeElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func constomizeElements() {
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setupConstraints() {
        containerView.addSubview(myTextField)
        NSLayoutConstraint.activate([
            
            myTextField.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 8),
            myTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            myTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            myTextField.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
