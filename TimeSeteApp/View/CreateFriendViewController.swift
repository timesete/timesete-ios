//
//  CreateFriendViewController.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 28/05/21.
//

import UIKit

class CreateFriendViewController: UIViewController, CreatePresenterDelegate {

    let presenter = CreateFriendPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setViewDelegate(delegate: self)
        self.view.setBackgroundColor(to: .appGray04)
        addSubviews()
        setupConstraints()
    }
    
    override func loadView() {
        self.view = UIView()
    }
    
    // MARK: Define elements
    private(set) lazy var friendView: UIView = {
        let friendView = UIView()
        friendView.setBackgroundColor(to: .gray)
        friendView.translatesAutoresizingMaskIntoConstraints = false
        return friendView
    }()

}
