//
//  ChatRequestView.swift
//  MySocialCircle
//
//  Created by Роман Карасёв on 03.12.2023.
//

import UIKit

class ChatRequestView: BaseProfileAndChatRequestView {
 
    
    let acceptButton = UIButton(title: "ACCEPT", titleColor: .white, backgroundColor: .black, font: .laoSangamMN20(), isShadow: false, cornerRadius: 10)
    let denyButton = UIButton(title: "Deny", titleColor: #colorLiteral(red: 0.8352941176, green: 0.2, blue: 0.2, alpha: 1), backgroundColor: .mainWhite(), font: .laoSangamMN20(), isShadow: false, cornerRadius: 10)
    
    
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
        denyButton.layer.borderWidth = 1.2
        denyButton.layer.borderColor = #colorLiteral(red: 0.8352941176, green: 0.2, blue: 0.2, alpha: 1)
        
        aboutMeLabel.text = "You have the opportunity to start a new chat"
        
    }
    
    private func setupConstraints() {
        
        let buttonsStackView = UIStackView(subviews: [acceptButton, denyButton], axis: .horizontal, spacing: 7)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.distribution = .fillEqually
        containerView.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            
            buttonsStackView.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 24),
            buttonsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            buttonsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
