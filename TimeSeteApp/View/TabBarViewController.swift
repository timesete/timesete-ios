//
//  TabBarViewController.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 27/05/21.
//

import UIKit

class TabBarViewController: UITabBarController, TabPresenterDelegate {

    let presenter = TabBarPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setViewDelegate(delegate: self)
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }

    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: UIViewController(),
                                title: "Home",
                                image: .selectOpen),
            
            createNavController(for: UIViewController(),
                                title: "Criar amigo",
                                image: UIImage(systemName: "house")!),
            
            createNavController(for: UIViewController(), title: "Mundo", image: .selectClose)
        ]
    }

}
