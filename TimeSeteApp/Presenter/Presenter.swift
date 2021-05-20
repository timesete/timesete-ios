//
//  Presenter.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 19/05/21.
//

import UIKit

protocol LoginPresenterDelegate: AnyObject {
    func presentLogin(credentials: Login)
//    func presentAlert(title: String, message: String)
}

typealias PresenterDelegate = LoginPresenterDelegate & UIViewController

class LoginPresenter {
    
    weak var delegate: PresenterDelegate?
    
    public func getLogin() {
        self.delegate?.presentLogin(credentials: Login(email: "oi", senha: "olá"))
    }
    
    public func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
    
    public func didTap() {
//        let title = "Teste"
//        let message = "Alerta"
//        
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil) )
//        delegate?.present(alert, animated: true)
    }
}
