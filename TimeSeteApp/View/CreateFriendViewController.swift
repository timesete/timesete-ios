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
    }
    
    override func loadView() {
        self.view = UIView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        setupConstraints()
    }
    
    // MARK: Friend created
    private(set) lazy var friendView: UIView = {
        let friendView = UIView()
        friendView.setBackgroundColor(to: .clear)
        friendView.translatesAutoresizingMaskIntoConstraints = false
        return friendView
    }()
    
    private(set) lazy var skinImage: UIImageView = {
        let skinImage = UIImageView()
        skinImage.image = .skin03
        skinImage.contentMode = .scaleAspectFit
        skinImage.translatesAutoresizingMaskIntoConstraints = false
        return skinImage
    }()
    
    private(set) lazy var legsImage: UIImageView = {
        let legsImage = UIImageView()
        legsImage.image = .wheelchair
        legsImage.contentMode = .scaleAspectFit
        legsImage.translatesAutoresizingMaskIntoConstraints = false
        return legsImage
    }()
    
    private(set) lazy var shirtImage: UIImageView = {
        let shirtImage = UIImageView()
        shirtImage.image = .shirt03
        shirtImage.contentMode = .scaleAspectFit
        shirtImage.translatesAutoresizingMaskIntoConstraints = false
        return shirtImage
    }()
    
    private(set) lazy var headImage: UIImageView = {
        let headImage = UIImageView()
        headImage.image = .brownHair01
        headImage.contentMode = .scaleAspectFit
        headImage.translatesAutoresizingMaskIntoConstraints = false
        return headImage
    }()

    // MARK: Parts
    private(set) lazy var partsView: UIView = {
        let partsView = UIView()
        partsView.setBackgroundColor(to: .appGray04)
        partsView.translatesAutoresizingMaskIntoConstraints = false
        return partsView
    }()
    
    private(set) lazy var partsCategoriesView: UIView = {
        let partsCategoriesView = UIView()
        partsCategoriesView.setBackgroundColor(to: .white)
        partsCategoriesView.layer.shadowColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        partsCategoriesView.layer.shadowOpacity = 1
        partsCategoriesView.layer.shadowRadius = 8
        partsCategoriesView.layer.shadowOffset = .zero
        partsCategoriesView.translatesAutoresizingMaskIntoConstraints = false
        return partsCategoriesView
    }()
    
    private(set) lazy var bottomView: UIView = {
        let bottomView = UIView()
        bottomView.setBackgroundColor(to: .white)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        return bottomView
    }()
}
