//
//  LoginPresenter.swift
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
    
    public func goToForgotPassword() {
        self.delegate?.navigationController?.pushViewController(RecoverPasswordViewController(), animated: true)
    }
    
    public func goToCreateFriend() {
        self.delegate?.navigationController?.pushViewController(CreateFriendViewController(), animated: true)
    }
    
    public func goToSignUp() {
        self.delegate?.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
}
