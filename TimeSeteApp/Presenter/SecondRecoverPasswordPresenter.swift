//
//  SecondRecoverPasswordPresenter.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 24/05/21.
//

import UIKit

protocol SecondRecoverPasswordPresenterDelegate: AnyObject {

}

typealias SecondRecoverPresenterDelegate = SecondRecoverPasswordPresenterDelegate & UIViewController

class SecondRecoverPasswordPresenter {
    
    weak var delegate: SecondRecoverPresenterDelegate?
    
    public func setViewDelegate(delegate: SecondRecoverPresenterDelegate) {
        self.delegate = delegate
    }
    
    public func getViewWidth() -> CGFloat? {
        self.delegate?.view.frame.size.width
    }
    
    public func backToRecoverPassword() {
        self.delegate?.navigationController?.popViewController(animated: true)
    }
    
    public func backToLogin() {
        self.delegate?.navigationController?.popToRootViewController(animated: true)
    }
}
