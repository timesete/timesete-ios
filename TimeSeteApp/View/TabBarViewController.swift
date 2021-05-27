//
//  TabBarViewController.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 27/05/21.
//

import UIKit

class TabBarViewController: UITabBarController, TabPresenterDelegate {

    let presenter = TabBarPresenter()
    private let tabBarKey = "tabBar"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setViewDelegate(delegate: self)
    
        view.backgroundColor = .appGray04
        
        setValue(CustomTabBar(), forKey: tabBarKey)
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.tintColor = .appCyan
        
        guard let viewWidth = presenter.getViewWidth() else { return }
        tabBar.sizeThatFits(CGSize(width: viewWidth, height: 80.0))

        setupVCs()
    }

    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage,
                                         selectedImage: UIImage? = nil) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
   
        navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage = selectedImage
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        
        if title == "Criar amigo" {
            navController.tabBarItem.imageInsets = UIEdgeInsets(top: -30, left: 0, bottom: 0, right: 0)
        }
        
        return navController
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: UIViewController(),
                                title: "Home",
                                image: .tabHome,
                                selectedImage: .tabHomeSelected),
            
            createNavController(for: SignUpViewController(),
                                title: "Criar amigo",
                                image: .tabCreateFriend),
            
            createNavController(for: UIViewController(), title: "Mundo", image: .tabWorld)
        ]
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.image == UIImage.tabCreateFriend {
            
            self.modalPresentationStyle = .fullScreen
            self.present(SignUpViewController(), animated: true, completion: nil)
        }
    }
    
}
