//
//  ViewController.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 18/05/21.
//

import UIKit

class LoginViewController: UIViewController, LoginPresenterDelegate {
    
    private let presenter = LoginPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter.setViewDelegate(delegate: self)
        presenter.getLogin()
        
    }
    
    override func loadView() {
        self.view = LoginView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.didTap()
    }

    func presentLogin(credentials: Login) {
        print("presentLogin")
        print(credentials)
    }
  
}
