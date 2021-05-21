//
//  SecondSignUpPresenter.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 21/05/21.
//

import UIKit

protocol SecondSignUpPresenterDelegate: AnyObject {
//    func presentSignUp(credentials: Login)
}

typealias SecondSignPresenterDelegate = SecondSignUpPresenterDelegate & UIViewController

class SecondSignUpPresenter {
    
    weak var delegate: SecondSignPresenterDelegate?
    
    public func setViewDelegate(delegate: SecondSignPresenterDelegate) {
        self.delegate = delegate
    }
    
    public func backToSignUp() {
        self.delegate?.navigationController?.popViewController(animated: true)
    }
    
    public func backToLogin() {
        self.delegate?.navigationController?.popToRootViewController(animated: true)
    }
}
