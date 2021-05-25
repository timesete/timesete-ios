//
//  RecoverPasswordPresenter.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 24/05/21.
//

import UIKit

protocol RecoverPasswordPresenterDelegate: AnyObject {

}

typealias RecoverPresenterDelegate = RecoverPasswordPresenterDelegate & UIViewController

class RecoverPasswordPresenter {
    
    weak var delegate: RecoverPresenterDelegate?
    
    public func setViewDelegate(delegate: RecoverPresenterDelegate) {
        self.delegate = delegate
    }
    
    public func getViewWidth() -> CGFloat? {
        self.delegate?.view.frame.size.width
    }
    
    public func goToSecondRecoverPassword() {
        self.delegate?.navigationController?.pushViewController(SecondRecoverPasswordViewController(), animated: true)
    }
    
    public func backToLogin() {
        self.delegate?.navigationController?.popToRootViewController(animated: true)
    }
}
