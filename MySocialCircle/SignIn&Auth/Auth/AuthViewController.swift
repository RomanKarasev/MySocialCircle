//
//  AuthViewController.swift
//  MySocialCircle
//
//  Created by Роман Карасёв on 24.11.2023.
//



import UIKit
import FirebaseCore
import FirebaseAuth

class AuthViewController: UIViewController {
    
    private let authView = AuthView()
    
    let signUpVC = SignUpViewcontroller()
    let loginVC = LoginViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = authView
        view.backgroundColor = .systemBackground
        
        addTargetToButtons()
        signUpVC.delegate = self
        loginVC.delegate = self
        
    }
    
    private func addTargetToButtons() {
        
        authView.emailButton.addTarget(self, action: #selector(emailButtonTapped), for: .touchUpInside)
        authView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
}

//MARK: @objc selectors for Buttons

@objc private extension AuthViewController {
    
    func emailButtonTapped() {
        present(signUpVC, animated: true, completion: nil)
    }
    
    func loginButtonTapped() {
        present(loginVC, animated: true, completion: nil)
    }
}

extension AuthViewController: AuthNavigationDelegate {
    func toLoginVC() {
        present(loginVC, animated: true)
    }
    
    func toSignUpVC() {
        present(loginVC, animated: true)
    }
    
    
}



// MARK: - import SwiftUI

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct AuthVCProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = AuthViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<AuthVCProvider.ContainerView>) -> some AuthViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: AuthVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AuthVCProvider.ContainerView>) {

        }
    }
}

