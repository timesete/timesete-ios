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
        
        // First category is selected
        category.setSelectedCategory(selectedCategory: .skin)
        skinButton.isSelected = true
    }
    
    override func loadView() {
        self.view = UIView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        setupConstraints()
        partsCollectionView.delegate = self
        partsCollectionView.dataSource = self
    }
    
    // Header
    private(set) lazy var headerView: UIView = {
        let headerView = UIView()
        headerView.setBackgroundColor(to: .white)
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
    
    private(set) lazy var navLabel: UILabel = {
        let navLabel = UILabel()
        navLabel.text = "Que tal criar um amigo para brincar?"
        navLabel.font = UIFont(name: .nunitoBold, size: 16)
        navLabel.textColor = .appPurple
        navLabel.translatesAutoresizingMaskIntoConstraints = false
        return navLabel
    }()
    
    private(set) lazy var navCloseButton: UIButton = {
        let navCloseButton = UIButton()
        navCloseButton.imageView?.contentMode = .scaleAspectFit
        navCloseButton.setImage(.closeButton, for: .normal)
        navCloseButton.setTitle(.none, for: .normal)
        navCloseButton.addTarget(self, action: #selector(navCloseAction), for: .touchUpInside)
        navCloseButton.translatesAutoresizingMaskIntoConstraints = false
        return navCloseButton
    }()
    
    private(set) lazy var auxiliaryView: UIView = {
        let auxiliaryView = UIView()
        auxiliaryView.setBackgroundColor(to: .clear)
        auxiliaryView.translatesAutoresizingMaskIntoConstraints = false
        return auxiliaryView
    }()
    
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
        partsCategoriesStackView.setBackgroundColor(to: .clear)
        partsCategoriesStackView.axis = .horizontal
        partsCategoriesStackView.distribution = .fillEqually
        partsCategoriesStackView.spacing = 29
        partsCategoriesStackView.translatesAutoresizingMaskIntoConstraints = false
        return partsCategoriesStackView
    }()
    
    private(set) lazy var skinButton: UIButton = {
        let skinButton = UIButton()
        skinButton.setTitle(.none, for: .normal)
        skinButton.adjustsImageWhenHighlighted = false
        skinButton.imageView?.contentMode = .scaleAspectFit
        skinButton.setImage(.skinCategory, for: .normal)
        skinButton.setImage(.skinCategorySelected, for: .selected)
        skinButton.addTarget(self, action: #selector(skinAction), for: .touchUpInside)
        skinButton.translatesAutoresizingMaskIntoConstraints = false
        return skinButton
    }()
    
    private(set) lazy var headButton: UIButton = {
        let headButton = UIButton()
        headButton.setTitle(.none, for: .normal)
        headButton.adjustsImageWhenHighlighted = false
        headButton.imageView?.contentMode = .scaleAspectFit
        headButton.setImage(.headCategory, for: .normal)
        headButton.setImage(.headCategorySelected, for: .selected)
        headButton.addTarget(self, action: #selector(headAction), for: .touchUpInside)
        headButton.translatesAutoresizingMaskIntoConstraints = false
        return headButton
    }()
    
    private(set) lazy var shirtButton: UIButton = {
        let shirtButton = UIButton()
        shirtButton.setTitle(.none, for: .normal)
        shirtButton.adjustsImageWhenHighlighted = false
        shirtButton.imageView?.contentMode = .scaleAspectFit
        shirtButton.setImage(.shirtCategory, for: .normal)
        shirtButton.setImage(.shirtCategorySelected, for: .selected)
        shirtButton.addTarget(self, action: #selector(shirtAction), for: .touchUpInside)
        shirtButton.translatesAutoresizingMaskIntoConstraints = false
        return shirtButton
    }()
    
    private(set) lazy var legsButton: UIButton = {
        let legsButton = UIButton()
        legsButton.setTitle(.none, for: .normal)
        legsButton.adjustsImageWhenHighlighted = false
        legsButton.imageView?.contentMode = .scaleAspectFit
        legsButton.setImage(.legsCategory, for: .normal)
        legsButton.setImage(.legsCategorySelected, for: .selected)
        legsButton.addTarget(self, action: #selector(legsAction), for: .touchUpInside)
        legsButton.translatesAutoresizingMaskIntoConstraints = false
        return legsButton
    }()
    
    private(set) lazy var optionsStackView: UIStackView = {
        let optionsStackView = UIStackView()
        optionsStackView.setBackgroundColor(to: .clear)
        optionsStackView.axis = .vertical
        optionsStackView.alignment = .leading
        optionsStackView.distribution = .fillProportionally

        optionsStackView.spacing = 16
        optionsStackView.translatesAutoresizingMaskIntoConstraints = false
        return optionsStackView
    }()
    
    private(set) lazy var partsCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let colorsCollectionView = UICollectionView(frame: CGRect(), collectionViewLayout: flowLayout)
        colorsCollectionView.backgroundColor = .appGray04
        colorsCollectionView.register(PartsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        colorsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return colorsCollectionView
    }()
    
    // Hair colors
    private(set) lazy var colorsStackView: UIStackView = {
        let colorsStackView = UIStackView()
        colorsStackView.setBackgroundColor(to: .clear)
        colorsStackView.axis = .horizontal
        colorsStackView.alignment = .fill
        colorsStackView.distribution = .fillProportionally
        colorsStackView.spacing = 16
        colorsStackView.isHidden = true
        colorsStackView.translatesAutoresizingMaskIntoConstraints = false
        return colorsStackView
    }()
    
    private(set) lazy var brownColorButton: UIButton = {
        let brownColorButton = UIButton()
        brownColorButton.setTitle(.none, for: .normal)
        brownColorButton.adjustsImageWhenHighlighted = false
        brownColorButton.imageView?.contentMode = .scaleAspectFit
        brownColorButton.setImage(UIImage(named: "brown-color"), for: .normal)
        brownColorButton.setImage(UIImage(named: "brown-color-selec"), for: .selected)
        brownColorButton.addTarget(self, action: #selector(brownColorAction), for: .touchUpInside)
        brownColorButton.translatesAutoresizingMaskIntoConstraints = false
        return brownColorButton
    }()
    
    private(set) lazy var blackColorButton: UIButton = {
        let blackColorButton = UIButton()
        blackColorButton.setTitle(.none, for: .normal)
        blackColorButton.adjustsImageWhenHighlighted = false
        blackColorButton.imageView?.contentMode = .scaleAspectFit
        blackColorButton.setImage(UIImage(named: "black-color"), for: .normal)
        blackColorButton.setImage(UIImage(named: "black-color-selec"), for: .selected)
        blackColorButton.addTarget(self, action: #selector(blackColorAction), for: .touchUpInside)
        blackColorButton.translatesAutoresizingMaskIntoConstraints = false
        return blackColorButton
    }()
    
    private(set) lazy var blondColorButton: UIButton = {
        let blondColorButton = UIButton()
        blondColorButton.setTitle(.none, for: .normal)
        blondColorButton.adjustsImageWhenHighlighted = false
        blondColorButton.imageView?.contentMode = .scaleAspectFit
        blondColorButton.setImage(UIImage(named: "blond-color"), for: .normal)
        blondColorButton.setImage(UIImage(named: "blond-color-selec"), for: .selected)
        blondColorButton.addTarget(self, action: #selector(blondColorAction), for: .touchUpInside)
        blondColorButton.translatesAutoresizingMaskIntoConstraints = false
        return blondColorButton
    }()
    
    private(set) lazy var redColorButton: UIButton = {
        let redColorButton = UIButton()
        redColorButton.setTitle(.none, for: .normal)
        redColorButton.adjustsImageWhenHighlighted = false
        redColorButton.imageView?.contentMode = .scaleAspectFit
        redColorButton.setImage(UIImage(named: "red-color"), for: .normal)
        redColorButton.setImage(UIImage(named: "red-color-selec"), for: .selected)
        redColorButton.addTarget(self, action: #selector(redColorAction), for: .touchUpInside)
        redColorButton.translatesAutoresizingMaskIntoConstraints = false
        return redColorButton
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

    // Alert
    func presentCustomAlert() {
        let alertView = CustomAlertViewController {
            self.navigationController?.popToRootViewController(animated: true)
        }
        alertView.modalPresentationStyle = .overCurrentContext
        alertView.modalTransitionStyle = .crossDissolve
        present(alertView, animated: true)
    }

    // MARK: Actions
    @objc func navCloseAction(sender: UIButton) {
        presenter.goToHome()
    }
    
    // Parts
    @objc func skinAction(sender: UIButton) {
        sender.isSelected = true
        headButton.isSelected = false
        shirtButton.isSelected = false
        legsButton.isSelected = false
        
        colorsStackView.isHidden = true
        category.setSelectedCategory(selectedCategory: .skin)
        partsCollectionView.reloadData()
    }
    
    @objc func headAction(sender: UIButton) {
        sender.isSelected  = true
        skinButton.isSelected = false
        shirtButton.isSelected = false
        legsButton.isSelected = false
        
        colorsStackView.isHidden = false
        brownColorButton.isSelected = true
        hairColor.setSelectedHairColor(selectedHairColor: .brown)
        category.setSelectedCategory(selectedCategory: .head)
        partsCollectionView.reloadData()
    }
    
    @objc func shirtAction(sender: UIButton) {
        sender.isSelected  = true
        skinButton.isSelected = false
        headButton.isSelected = false
        legsButton.isSelected = false
        
        colorsStackView.isHidden = true
        category.setSelectedCategory(selectedCategory: .shirt)
        partsCollectionView.reloadData()
    }
    
    @objc func legsAction(sender: UIButton) {
        sender.isSelected = true
        skinButton.isSelected = false
        headButton.isSelected = false
        shirtButton.isSelected = false
        
        colorsStackView.isHidden = true
        category.setSelectedCategory(selectedCategory: .legs)
        partsCollectionView.reloadData()
    }
    
    // Hair Colors Actions
    @objc func brownColorAction(sender: UIButton) {
        sender.isSelected  = true
        blackColorButton.isSelected = false
        blondColorButton.isSelected = false
        redColorButton.isSelected = false
        
        hairColor.setSelectedHairColor(selectedHairColor: .brown)
    }
    
    @objc func blackColorAction(sender: UIButton) {
        sender.isSelected  = true
        brownColorButton.isSelected = false
        blondColorButton.isSelected = false
        redColorButton.isSelected = false
        
        hairColor.setSelectedHairColor(selectedHairColor: .black)
    }
    
    @objc func blondColorAction(sender: UIButton) {
        sender.isSelected  = true
        brownColorButton.isSelected = false
        blackColorButton.isSelected = false
        redColorButton.isSelected = false
        
        hairColor.setSelectedHairColor(selectedHairColor: .blond)
    }
    
    @objc func redColorAction(sender: UIButton) {
        sender.isSelected  = true
        brownColorButton.isSelected = false
        blackColorButton.isSelected = false
        blondColorButton.isSelected = false
        
        hairColor.setSelectedHairColor(selectedHairColor: .red)
    }
    
    @objc func createFriendAction(sender: UIButton) {
        presentCustomAlert()
    }
    
    func getKey(of dictionary: [String: String], at index: Int) -> String? {
        let orderedDictionary = dictionary.keys.sorted()
        return orderedDictionary[index]
    }
    
    func getValue(of dictionary: [String: String], at index: Int) -> String? {
        let orderedDictionary = dictionary.values.sorted()
        return orderedDictionary[index]
    }
    
    func verifyHair(index: Int) -> UIImage {
        let selectedColor = hairColor.getSelectedHairColor()
        var head = UIImage()
        
        switch selectedColor {
        case .brown:
            head = UIImage(named: brownHairFriend[index]) ?? UIImage()
        case .black:
            head = UIImage(named: blackHairFriend[index]) ?? UIImage()
        case .blond:
            head = UIImage(named: blondHairFriend[index]) ?? UIImage()
        default:
            head = UIImage(named: redHairFriend[index]) ?? UIImage()
        }
        
        return head
    }
}
