//
//  ChatRequestViewController.swift
//  MySocialCircle
//
//  Created by Роман Карасёв on 03.12.2023.
//


import UIKit

class ChatRequestViewController: UIViewController {
    
    let chatRequestView = ChatRequestView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = chatRequestView
        view.backgroundColor = .white
        
        setOptions()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.chatRequestView.acceptButton.applyGradients(cornerRadius: 10)
    }
    
    
    private func setOptions() {
        
        chatRequestView.acceptButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        chatRequestView.denyButton.addTarget(self, action: #selector(denyButtonTapped), for: .touchUpInside)
    
    }
    
    @objc private func acceptButtonTapped() {
        print(#function)
    }
    
    @objc private func denyButtonTapped() {
        print(#function)
    }
    
}


// MARK: - SwiftUI
import SwiftUI

struct ChatRequestVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let chatRequestVC = ChatRequestViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ChatRequestVCProvider.ContainerView>) -> ChatRequestViewController {
            return chatRequestVC
        }
        
        func updateUIViewController(_ uiViewController: ChatRequestVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ChatRequestVCProvider.ContainerView>) {
            
        }
    }
}


