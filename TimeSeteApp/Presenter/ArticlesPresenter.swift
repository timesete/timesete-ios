//
//  ArticlesPresenter.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 01/06/21.
//

import UIKit

protocol ArticlesPresenterDelegate: AnyObject {

}

typealias ArticPresenterDelegate = ArticlesPresenterDelegate & UIViewController

class ArticlesPresenter {
    
    weak var delegate: ArticPresenterDelegate?
    
    public func setViewDelegate(delegate: ArticPresenterDelegate) {
        self.delegate = delegate
    }
    
    public func openArticle() {
        self.delegate?.navigationController?.popViewController(animated: true)
    }
}
