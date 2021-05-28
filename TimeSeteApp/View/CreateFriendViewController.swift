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
    
    private(set) lazy var skinImage: UIImageView = {
        let skinImage = UIImageView()
        skinImage.image = .none
        skinImage.contentMode = .scaleAspectFit
        skinImage.translatesAutoresizingMaskIntoConstraints = false
        return skinImage
    }()
    
    private(set) lazy var legsImage: UIImageView = {
        let legsImage = UIImageView()
        legsImage.image = .none
        legsImage.contentMode = .scaleAspectFit
        legsImage.translatesAutoresizingMaskIntoConstraints = false
        return legsImage
    }()
    
    private(set) lazy var shirtImage: UIImageView = {
        let shirtImage = UIImageView()
        shirtImage.image = .none
        shirtImage.contentMode = .scaleAspectFit
        shirtImage.translatesAutoresizingMaskIntoConstraints = false
        return shirtImage
    }()
    
    private(set) lazy var headImage: UIImageView = {
        let headImage = UIImageView()
        headImage.image = .none
        headImage.contentMode = .scaleAspectFit
        headImage.translatesAutoresizingMaskIntoConstraints = false
        return headImage
    }()

}
