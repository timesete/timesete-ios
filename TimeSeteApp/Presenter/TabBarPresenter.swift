//
//  TabBarPresenter.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 27/05/21.
//

import UIKit

protocol TabPresenterDelegate: AnyObject {

}

typealias TabBarPresenterDelegate = TabPresenterDelegate & UIViewController

class TabBarPresenter {
    
    weak var delegate: TabBarPresenterDelegate?
    
    public func setViewDelegate(delegate: TabBarPresenterDelegate) {
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
