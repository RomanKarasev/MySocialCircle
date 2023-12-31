//
//  MaintabBarController.swift
//  MySocialCircle
//
//  Created by Роман Карасёв on 29.11.2023.
//

import UIKit

class MaintabBarController: UITabBarController {
    
    private let currentUser: MUser
    
    init(currentUser: MUser = MUser(username: "",
                                    email: "",
                                    avatarStringURL: "",
                                    description: "",
                                    sex: "",
                                    id: "")) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setControllers()
        
        tabBar.backgroundColor = .white
    }
    
    private func setControllers() {
        
        let peopleVC = PeopleViewController(currentUser: currentUser)
        let convVC = ConversationViewController(currentUser: currentUser)
        
        
        viewControllers = [
            createNavController(rootVC: peopleVC, title: "People", image: setImage(with: "person.2")),
            createNavController(rootVC: convVC, title: "Conversations", image: setImage(with: "bubble.left.and.bubble.right"))
                
            ]
        }
            
    
    private func setImage(with name: String) -> UIImage {
        let imageConfigure = UIImage.SymbolConfiguration(weight: .medium)
        guard let mainImage = UIImage(systemName: name, withConfiguration: imageConfigure) else {
            return UIImage()
        }
        return mainImage
        
        
    }
    
    private func createNavController(rootVC: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootVC)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        
        return navController
    }
}
