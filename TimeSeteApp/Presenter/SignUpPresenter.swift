//
//  SignUpPresenter.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 20/05/21.
//

import UIKit

protocol SignUpPresenterDelegate: AnyObject {
    func presentSignUp(credentials: Login)
}

typealias SignPresenterDelegate = SignUpPresenterDelegate & UIViewController

class SignUpPresenter {
    
    weak var delegate: SignPresenterDelegate?
    
    public func getLogin() {
        self.delegate?.presentSignUp(credentials: Login(email: "oi", senha: "olá"))
    }
    
    public func setViewDelegate(delegate: SignPresenterDelegate) {
        self.delegate = delegate
    }
    
    public func goToSecondSignUp() {
        self.delegate?.navigationController?.pushViewController(SecondSignUpViewController(), animated: true)
    }
    
    public func backToLogin() {
        self.delegate?.navigationController?.popViewController(animated: true)
    }
}
