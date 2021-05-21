//
//  SecondSignUpViewController.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 21/05/21.
//

import UIKit

class SecondSignUpViewController: UIViewController, SecondSignUpPresenterDelegate {

    private let presenter = SecondSignUpPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setBackgroundColor(to: .appGray04)
        presenter.setViewDelegate(delegate: self)
//        addSubviews()
//        setupConstraints()
    }
    
    override func loadView() {
        self.view = UIView()
    }

}
