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
    
    private(set) lazy var partsCategoriesStackView: UIStackView = {
        let partsCategoriesStackView = UIStackView()
        partsCategoriesStackView.setBackgroundColor(to: .systemPink)
        partsCategoriesStackView.axis = .horizontal
        partsCategoriesStackView.distribution = .fillEqually
        partsCategoriesStackView.spacing = 29
        partsCategoriesStackView.translatesAutoresizingMaskIntoConstraints = false
        return partsCategoriesStackView
    }()
    
    private(set) lazy var skinButton: UIButton = {
        let skinButton = UIButton()
        skinButton.setTitle(.none, for: .normal)
        skinButton.setBackgroundImage(.skin01, for: .normal)
        skinButton.setBackgroundImage(.skin04, for: .selected)
        skinButton.addTarget(self, action: #selector(skinAction), for: .touchUpInside)
        skinButton.translatesAutoresizingMaskIntoConstraints = false
        return skinButton
    }()
    
    private(set) lazy var headButton: UIButton = {
        let headButton = UIButton()
        headButton.setTitle(.none, for: .normal)
        headButton.setBackgroundImage(.redHair01, for: .normal)
        headButton.setBackgroundImage(.redHair02, for: .selected)
        headButton.addTarget(self, action: #selector(headAction), for: .touchUpInside)
        headButton.translatesAutoresizingMaskIntoConstraints = false
        return headButton
    }()
    
    private(set) lazy var shirtButton: UIButton = {
        let shirtButton = UIButton()
        shirtButton.setTitle(.none, for: .normal)
        shirtButton.setBackgroundImage(.shirt01, for: .normal)
        shirtButton.setBackgroundImage(.shirt02, for: .selected)
        shirtButton.addTarget(self, action: #selector(shirtAction), for: .touchUpInside)
        shirtButton.translatesAutoresizingMaskIntoConstraints = false
        return shirtButton
    }()
    
    private(set) lazy var legsButton: UIButton = {
        let legsButton = UIButton()
        legsButton.setTitle(.none, for: .normal)
        legsButton.setBackgroundImage(.wheelchair, for: .normal)
        legsButton.setBackgroundImage(.pants01, for: .selected)
        legsButton.addTarget(self, action: #selector(legsAction), for: .touchUpInside)
        legsButton.translatesAutoresizingMaskIntoConstraints = false
        return legsButton
    }()
    
    // Footer
    private(set) lazy var bottomView: UIView = {
        let bottomView = UIView()
        bottomView.setBackgroundColor(to: .white)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        return bottomView
    }()
    
    private(set) lazy var createFriendButton: UIButton = {
        let createFriendButton = UIButton()
        createFriendButton.setTitle("Criar novo amigo", for: .normal)
        createFriendButton.setTitleColor(.white, for: .normal)
        createFriendButton.titleLabel?.font = UIFont(name: .nunitoBlack, size: 18)
        createFriendButton.setBackgroundImage(.purpleButton, for: .normal)
        createFriendButton.setBackgroundImage(.purpleDarkButton, for: .highlighted)
        createFriendButton.addTarget(self, action: #selector(createFriendAction), for: .touchUpInside)
        createFriendButton.translatesAutoresizingMaskIntoConstraints = false
        return createFriendButton
    }()
    
    // MARK: Actions
    @objc func skinAction(sender: UIButton) {
        // pele
        sender.isSelected ? (sender.isSelected = false) : (sender.isSelected = true)
        headButton.isSelected = false
        shirtButton.isSelected = false
        legsButton.isSelected = false
        // set categoria selecionada
        // reload data
    }
    
    @objc func headAction(sender: UIButton) {
        // cabeça
        sender.isSelected ? (sender.isSelected = false) : (sender.isSelected = true)
        skinButton.isSelected = false
        shirtButton.isSelected = false
        legsButton.isSelected = false
        // set categoria selecionada
        // reload data
    }
    
    @objc func shirtAction(sender: UIButton) {
        // blusa
        sender.isSelected ? (sender.isSelected = false) : (sender.isSelected = true)
        skinButton.isSelected = false
        headButton.isSelected = false
        legsButton.isSelected = false
        // set categoria selecionada
        // reload data
    }
    
    @objc func legsAction(sender: UIButton) {
        // pernas
        sender.isSelected ? (sender.isSelected = false) : (sender.isSelected = true)
        skinButton.isSelected = false
        headButton.isSelected = false
        shirtButton.isSelected = false
        // set categoria selecionada
        // reload data
    }
    
    @objc func createFriendAction(sender: UIButton) {
        // criar amigo
    }
}
