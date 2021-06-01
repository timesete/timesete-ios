//
//  ContentsPresenter.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 01/06/21.
//

import UIKit

protocol ContentsPresenterDelegate: AnyObject {

}

typealias ContPresenterDelegate = ContentsPresenterDelegate & UIViewController

class ContentsPresenter {
    
    weak var delegate: ContPresenterDelegate?
    
    public func setViewDelegate(delegate: ContPresenterDelegate) {
        self.delegate = delegate
    }
    
    public func backToScenery() {
        self.delegate?.navigationController?.popViewController(animated: true)
    }
}
