//
//  ContentsViewController.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 01/06/21.
//

import UIKit

class ContentsViewController: UIViewController, ContentsPresenterDelegate {

    let presenter = ContentsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.setViewDelegate(delegate: self)
        self.view.setBackgroundColor(to: .appGray04)
        self.navigationController?.isNavigationBarHidden = true
        addSubviews()
        setupConstraints()
    }

}
