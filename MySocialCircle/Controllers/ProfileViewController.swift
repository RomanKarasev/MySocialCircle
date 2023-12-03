//
//  ProfileViewController.swift
//  MySocialCircle
//
//  Created by Роман Карасёв on 03.12.2023.
//


import UIKit

class ProfileViewController: UIViewController {
    
    let profileView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = profileView
        view.backgroundColor = .white
        
        setOptions()
    }
    
    
    private func setOptions() {
        if let button = profileView.myTextField.rightView as? UIButton {
                button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
            }
        }
        
        @objc private func sendMessage() {
            print(#function)
        }
        

    
}


// MARK: - SwiftUI
import SwiftUI

struct ProfileVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let profileVC = ProfileViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ProfileVCProvider.ContainerView>) -> ProfileViewController {
            return profileVC
        }
        
        func updateUIViewController(_ uiViewController: ProfileVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ProfileVCProvider.ContainerView>) {
            
        }
    }
}

