//
//  SignUpViewcontroller.swift
//  MySocialCircle
//
//  Created by Роман Карасёв on 24.11.2023.
//


import UIKit

class SignUpViewcontroller: UIViewController {
    
    let signUpView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = signUpView
        view.backgroundColor = .systemBackground
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


