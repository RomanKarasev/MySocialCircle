//
//  AuthViewController.swift
//  MySocialCircle
//
//  Created by Роман Карасёв on 24.11.2023.
//


import UIKit

class AuthViewController: UIViewController {
    
    private let authView = AuthView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = authView
        view.backgroundColor = .systemBackground
    }
}



// MARK: - import SwiftUI

import SwiftUI

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

