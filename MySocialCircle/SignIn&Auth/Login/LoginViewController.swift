//
//  LoginViewController.swift
//  MySocialCircle
//
//  Created by Роман Карасёв on 24.11.2023.
//


import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    
    weak var delegate: AuthNavigationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = loginView
        view.backgroundColor = .white
        addTargetToButtons()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func addTargetToButtons() {
        
        loginView.signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
}

//MARK: @objc selectors for Buttons

@objc private extension LoginViewController {
    
    func signUpButtonTapped() {
        dismiss(animated: true) {
            self.delegate?.toSignUpVC()
        }
        
    }
    
    func loginButtonTapped() {
        AuthService.shared.login(email: loginView.emailTextField.text!, password: loginView.passwordTextField.text!) { (result) in
            switch result {
                
            case .success(let user):
                self.showAlert(with: "Successfully!", and: "You are logged in")
                FirestoreService.shared.getUserData(user: user) { (result) in
                    switch result {
                        
                    case .success(let muser):
                        let mainTabBarVC = MaintabBarController(currentUser: muser)
                        mainTabBarVC.modalPresentationStyle = .fullScreen
                        self.present(mainTabBarVC, animated: true)
                    case .failure(_):
                        self.present(SetupProfileViewController(currentUser: user), animated: true)
                    }
                }
            case .failure(let error):
                self.showAlert(with: "Error!", and: error.localizedDescription)
            }
        }
    }
}



// MARK: - SwiftUI
import SwiftUI

struct LoginVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let loginVC = LoginViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<LoginVCProvider.ContainerView>) -> LoginViewController {
            return loginVC
        }
        
        func updateUIViewController(_ uiViewController: LoginVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<LoginVCProvider.ContainerView>) {
            
        }
    }
}

