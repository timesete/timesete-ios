//
//  CreateFriendPresenter.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 28/05/21.
//

import UIKit

protocol CreatePresenterDelegate: AnyObject {

}

typealias CreateFriendPresenterDelegate = CreatePresenterDelegate & UIViewController

class CreateFriendPresenter {
    
    weak var delegate: CreateFriendPresenterDelegate?
    
    public func setViewDelegate(delegate: CreateFriendPresenterDelegate) {
        self.delegate = delegate
    }
    
    public func getViewWidth() -> CGFloat? {
        self.delegate?.view.frame.size.width
    }
 
}
