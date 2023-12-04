//
//  SignUpViewcontroller.swift
//  MySocialCircle
//
//  Created by Роман Карасёв on 24.11.2023.
//


import UIKit

class SignUpViewcontroller: UIViewController {
    
    let signUpView = SignUpView()
    
    weak var delegate: AuthNavigationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = signUpView
        view.backgroundColor = .systemBackground
        
        addTargetToButtons()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func addTargetToButtons() {
        
        signUpView.signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        signUpView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
    }
    
}

extension UIViewController {
    func showAlert(with title: String, and message: String, complition: @escaping() -> Void = {}) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            complition()
        }
        
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

//MARK: @objc selectors for Buttons

@objc private extension SignUpViewcontroller {
    
    func signUpButtonTapped() {
        print(#function)
        AuthService.shared.register(email: signUpView.emailTextField.text,
                                    password: signUpView.passwordTextField.text,
                                    confirmPassword: signUpView.confirmPasswordTextField.text) { (result) in
            switch result {
                
            case .success(let user):
                self.showAlert(with: "Successfully!", and: "You are registered") {
                    self.present(SetupProfileViewController(currentUser: user), animated: true, completion: nil)
                }
                print(user.email)
            case .failure(let error):
                self.showAlert(with: "Error!", and: error.localizedDescription)
            }
        }
    }
    
    func loginButtonTapped() {
        dismiss(animated: true) {
            self.delegate?.toLoginVC()
        }
        
        
    }
    
}


// MARK: - import SwiftUI
import SwiftUI

struct SignUPVCProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = SignUpViewcontroller()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SignUPVCProvider.ContainerView>) -> some SignUpViewcontroller {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: SignUPVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SignUPVCProvider.ContainerView>) {
            
        }
    }
}


