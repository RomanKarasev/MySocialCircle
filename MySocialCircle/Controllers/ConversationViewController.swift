//
//  ConversationViewController.swift
//  MySocialCircle
//
//  Created by Роман Карасёв on 29.11.2023.
//

import UIKit

class ConversationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainWhite()
        
        createSearchBar()
    }
    
    private func createSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
}

extension ConversationViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

// MARK: - import SwiftUI

import SwiftUI

struct ConvVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let navBar = MaintabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ConvVCProvider.ContainerView>) -> MaintabBarController {
            return navBar
        }
        
        func updateUIViewController(_ uiViewController: ConvVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ConvVCProvider.ContainerView>) {
            
        }
    }
}
