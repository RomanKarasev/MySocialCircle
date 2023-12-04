//
//  AuthView.swift
//  MySocialCircle
//
//  Created by Роман Карасёв on 24.11.2023.
//

import UIKit

class AuthView: UIView {
    
    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"), contentMode: .scaleAspectFit)
    
    
    let emailLabel = UILabel(text: "Or sign up with")
    let loginLabel = UILabel(text: "Alerady onboard?")
    
    
    let emailButton = UIButton(title: "Email", titleColor: .white, backgroundColor: .buttonDark())
    let loginButton = UIButton(title: "Login", titleColor: .buttonRed(), backgroundColor: .white, isShadow: true)
    
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: setConstraints
    
    func setConstraints() {
        
        
        let emailView = ButtonLabelView(label: emailLabel, button: emailButton)
        let loginView = ButtonLabelView(label: loginLabel, button: loginButton)
        
        let stackView = UIStackView(subviews: [emailView, loginView],
                                    axis: .vertical,
                                    spacing: 40)
        
        
        addSubview(logoImageView)
        addSubview(stackView)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 160),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 160),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -40)
            ])
    }
}
