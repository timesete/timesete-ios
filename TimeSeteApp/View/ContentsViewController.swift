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

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
    
    // Header
    private(set) lazy var headerView: UIView = {
        let headerView = UIView()
        headerView.setBackgroundColor(to: .appPurple)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private(set) lazy var backButton: UIButton = {
        let backButton = UIButton()
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.setImage(.backButton, for: .normal)
        backButton.setTitle(.none, for: .normal)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        return backButton
    }()
    
    // MARK: Actions
    @objc func backAction(sender: UIButton) {
        presenter.backToScenery()
    }
}
