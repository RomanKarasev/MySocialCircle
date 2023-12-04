//
//  LoginView.swift
//  MySocialCircle
//
//  Created by Роман Карасёв on 24.11.2023.
//


import UIKit

class LoginView: UIView {
    
    let welcomeLabel = UILabel(text: "Welcome back!", font: .avenir26())
    
    let loginWithLabel = UILabel(text: "Login with")
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "Password")
    let needAnAccountLabel = UILabel(text: "Need an account?")
    
    let emailTextField = OneLineTextField(font: .avenir20())
    let passwordTextField = OneLineTextField(font: .avenir20())
    let loginButton = UIButton(title: "Login", titleColor: .white, backgroundColor: .buttonDark())
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.buttonRed(), for: .normal)
        button.titleLabel?.font = .avenir20()
        return button
    }()
    
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
        
        
        
        let emailStackView = UIStackView(subviews: [emailLabel, emailTextField],
                                         axis: .vertical,
                                         spacing: 0)
        let passwordStackView = UIStackView(subviews: [passwordLabel, passwordTextField],
        axis: .vertical,
        spacing: 0)
        
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        let stackView = UIStackView(subviews: [
            loginWithLabel,
            emailStackView,
            passwordStackView,
            loginButton
            ],
                                    axis: .vertical,
                                    spacing: 40)
        
        signUpButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(subviews: [needAnAccountLabel, signUpButton],
                                          axis: .horizontal,
                                          spacing: 10)
        bottomStackView.alignment = .firstBaseline
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        loginWithLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(loginWithLabel)
        addSubview(welcomeLabel)
        addSubview(stackView)
        addSubview(bottomStackView)
        
//MARK: activate Constraints
        
        NSLayoutConstraint.activate([
            
            welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            loginWithLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 100),
            loginWithLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
            stackView.topAnchor.constraint(equalTo: loginWithLabel.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            
            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            bottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
    }
}

