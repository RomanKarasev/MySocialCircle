//
//  SetupProfileViewController.swift
//  MySocialCircle
//
//  Created by Роман Карасёв on 24.11.2023.
//


import UIKit
import FirebaseAuth

class SetupProfileViewController: UIViewController {
    
    let setupProfileView = SetupProfileView()
    
    private let currentUser: User
    
    init(currentUser: User) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = setupProfileView
        view.backgroundColor = .systemBackground
        addTargetToButtons()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func addTargetToButtons() {
        
        setupProfileView.goToChatsButton.addTarget(self, action: #selector(goToChatsButtonTapped), for: .touchUpInside)
    }
}

//MARK: @objc selectors for Buttons

@objc private extension SetupProfileViewController {
    
    func goToChatsButtonTapped() {
        FirestoreService.shared.saveProfileWith(
            id: currentUser.uid,
            email: currentUser.email!,
            username: setupProfileView.fullNameTextField.text,
            avatarImageString: "",
            description: setupProfileView.aboutMeTextField.text,
            sex: setupProfileView.sexSegmentedControl.titleForSegment(at: setupProfileView.sexSegmentedControl.selectedSegmentIndex)) { (result) in
                switch result {
                    
                case .success(let muser):
                    self.showAlert(with: "Successfully!", and: "Have a nice chat") {
                        let mainTabBarVC = MaintabBarController(currentUser: muser)
                        mainTabBarVC.modalPresentationStyle = .fullScreen
                        self.present(mainTabBarVC, animated: true)
                    }
                    
                case .failure(let error):
                    self.showAlert(with: "Error!", and: error.localizedDescription)
                }
            }
    }
}


// MARK: - import SwiftUI

import SwiftUI

struct SetupProfileVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let setupProfileVC = SetupProfileViewController(currentUser: Auth.auth().currentUser!)
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SetupProfileVCProvider.ContainerView>) -> SetupProfileViewController {
            return setupProfileVC
        }
        
        func updateUIViewController(_ uiViewController: SetupProfileVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SetupProfileVCProvider.ContainerView>) {
            
        }
    }
}
  
