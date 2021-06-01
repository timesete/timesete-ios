//
//  WorldViewController.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 31/05/21.
//

import UIKit

class WorldViewController: UIViewController, WorldPresenterDelegate {

    let presenter = WorldPresenter()
    
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
    
    private(set) lazy var navStackView: UIStackView = {
        let navStackView = UIStackView()
        navStackView.setBackgroundColor(to: .clear)
        navStackView.axis = .horizontal
        navStackView.alignment = .center
        navStackView.distribution = .fillProportionally
        navStackView.spacing = 8
        navStackView.translatesAutoresizingMaskIntoConstraints = false
        return navStackView
    }()
    
    private(set) lazy var profileButton: UIButton = {
        let profileButton = UIButton()
        profileButton.imageView?.contentMode = .scaleAspectFit
        profileButton.setImage(UIImage(named: "profile-1"), for: .normal)
        profileButton.setTitle(.none, for: .normal)
        profileButton.addTarget(self, action: #selector(profileAction), for: .touchUpInside)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        return profileButton
    }()
    
    private(set) lazy var navLabel: UILabel = {
        let navLabel = UILabel()
        navLabel.text = "Olá, amigo!"
        navLabel.font = UIFont(name: .nunitoBlack, size: 18)
        navLabel.textColor = .white
        navLabel.translatesAutoresizingMaskIntoConstraints = false
        return navLabel
    }()
    
    private(set) lazy var messageView: UIView = {
        let messageView = UIView()
        messageView.setBackgroundColor(to: .appBlack40)
        messageView.translatesAutoresizingMaskIntoConstraints = false
        return messageView
    }()
    
    private(set) lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.text = "Clique nos seus amigos e descubra mais sobre eles"
        messageLabel.font = UIFont(name: .nunitoBlack, size: 16)
        messageLabel.numberOfLines = 0
        messageLabel.textColor = .white
        messageLabel.textAlignment = .center
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        return messageLabel
    }()
    
    private(set) lazy var sceneryImage: UIImageView = {
        let sceneryImage = UIImageView()
        sceneryImage.image = .scenery
        sceneryImage.contentMode = .scaleToFill
        sceneryImage.translatesAutoresizingMaskIntoConstraints = false
        return sceneryImage
    }()
    
    // Friends
    private(set) lazy var friend01Image: UIImageView = {
        let friend01Image = UIImageView()
        friend01Image.image = .friend01
        friend01Image.contentMode = .scaleAspectFit
        friend01Image.translatesAutoresizingMaskIntoConstraints = false
        return friend01Image
    }()
    
    private(set) lazy var friend02Image: UIImageView = {
        let friend02Image = UIImageView()
        friend02Image.image = .friend02
        friend02Image.contentMode = .scaleAspectFit
        friend02Image.translatesAutoresizingMaskIntoConstraints = false
        return friend02Image
    }()
    
    private(set) lazy var friend03Image: UIImageView = {
        let friend03Image = UIImageView()
        friend03Image.image = .friend03
        friend03Image.contentMode = .scaleAspectFit
        friend03Image.translatesAutoresizingMaskIntoConstraints = false
        return friend03Image
    }()
    
    @objc func profileAction(sender: UIButton) {
        print("Perfil")
    }

}
