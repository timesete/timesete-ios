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
        
        addSubviews()
        setupConstraints()
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
    
    @objc func profileAction(sender: UIButton) {
        print("Perfil")
    }

}
