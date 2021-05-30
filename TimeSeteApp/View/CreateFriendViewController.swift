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
        partsCollectionView.delegate = self
        partsCollectionView.dataSource = self
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
        skinButton.setBackgroundImage(.skinCategory, for: .normal)
        skinButton.setBackgroundImage(.skinCategorySelected, for: .selected)
        skinButton.addTarget(self, action: #selector(skinAction), for: .touchUpInside)
        skinButton.translatesAutoresizingMaskIntoConstraints = false
        return skinButton
    }()
    
    private(set) lazy var headButton: UIButton = {
        let headButton = UIButton()
        headButton.setTitle(.none, for: .normal)
        headButton.adjustsImageWhenHighlighted = false
        headButton.setBackgroundImage(.headCategory, for: .normal)
        headButton.setBackgroundImage(.headCategorySelected, for: .selected)
        headButton.addTarget(self, action: #selector(headAction), for: .touchUpInside)
        headButton.translatesAutoresizingMaskIntoConstraints = false
        return headButton
    }()
    
    private(set) lazy var shirtButton: UIButton = {
        let shirtButton = UIButton()
        shirtButton.setTitle(.none, for: .normal)
        shirtButton.adjustsImageWhenHighlighted = false
        shirtButton.setBackgroundImage(.shirtCategory, for: .normal)
        shirtButton.setBackgroundImage(.shirtCategorySelected, for: .selected)
        shirtButton.addTarget(self, action: #selector(shirtAction), for: .touchUpInside)
        shirtButton.translatesAutoresizingMaskIntoConstraints = false
        return shirtButton
    }()
    
    private(set) lazy var legsButton: UIButton = {
        let legsButton = UIButton()
        legsButton.setTitle(.none, for: .normal)
        legsButton.adjustsImageWhenHighlighted = false
        legsButton.setBackgroundImage(.legsCategory, for: .normal)
        legsButton.setBackgroundImage(.legsCategorySelected, for: .selected)
        legsButton.addTarget(self, action: #selector(legsAction), for: .touchUpInside)
        legsButton.translatesAutoresizingMaskIntoConstraints = false
        return legsButton
    }()
    
    private(set) lazy var partsCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let colorsCollectionView = UICollectionView(frame: CGRect(), collectionViewLayout: flowLayout)
        colorsCollectionView.backgroundColor = .appGray04
        colorsCollectionView.register(ColorsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        colorsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return colorsCollectionView
    }()
    
    private(set) lazy var headView: UIView = {
        let headView = UIView()
        headView.setBackgroundColor(to: .appGray04)
        headView.translatesAutoresizingMaskIntoConstraints = false
        return headView
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
        sender.isSelected = true
        headButton.isSelected = false
        shirtButton.isSelected = false
        legsButton.isSelected = false
        
        cat.setCategoriaSelecionada(categoriaSelectionada: .skin)
        partsCollectionView.reloadData()
    }
    
    @objc func headAction(sender: UIButton) {
        // cabeça
        sender.isSelected  = true
        skinButton.isSelected = false
        shirtButton.isSelected = false
        legsButton.isSelected = false
        
        cat.setCategoriaSelecionada(categoriaSelectionada: .head)
        partsCollectionView.reloadData()
    }
    
    @objc func shirtAction(sender: UIButton) {
        // blusa
        sender.isSelected  = true
        skinButton.isSelected = false
        headButton.isSelected = false
        legsButton.isSelected = false
        
        cat.setCategoriaSelecionada(categoriaSelectionada: .shirt)
        partsCollectionView.reloadData()
    }
    
    @objc func legsAction(sender: UIButton) {
        // pernas
        sender.isSelected = true
        skinButton.isSelected = false
        headButton.isSelected = false
        shirtButton.isSelected = false
        
        cat.setCategoriaSelecionada(categoriaSelectionada: .legs)
        partsCollectionView.reloadData()
    }
    
    @objc func createFriendAction(sender: UIButton) {
        // criar amigo
    }
    
    func getKey(of dictionary: [String: String], at index: Int) -> String? {
        let index = dictionary.index(dictionary.startIndex, offsetBy: index)
        return dictionary.keys[index]
    }
    
    func getValue(of dictionary: [String: String], at index: Int) -> String? {
        let index = dictionary.index(dictionary.startIndex, offsetBy: index)
        return dictionary.values[index]
    }
}

enum Category {
    case skin
    case head
    case shirt
    case legs
}

struct CategoriaSelecionada {
    var categoriaSelectionada: Category

    init(categoriaSelectionada: Category) {
        self.categoriaSelectionada = categoriaSelectionada
    }
    
    func getCategoriaSelecionada() -> Category {
        categoriaSelectionada
    }
    
    mutating func setCategoriaSelecionada(categoriaSelectionada: Category) {
        self.categoriaSelectionada = categoriaSelectionada
    }
}

// Assets que "vestem" o personagem
let skinFriend = ["skin-1", "skin-2", "skin-3", "skin-4", "skin-5"]
let shirtFriend = ["shirt-1", "shirt-2", "shirt-3"]
let legsFriend = ["pants-1", "pants-and-glasses", "wheelchair"]

// let headFriend = []

// key: opções no menu
// value: opções no menu selecionadas
let selectedShirts = ["option-shirt-1": "option-shirt-01-selec",
                      "option-shirt-2": "option-shirt-02-selec",
                      "option-shirt-3": "option-shirt-03-selec"]
let selectedSkins = ["option-skin-1": "option-skin-01-selec",
                     "option-skin-2": "option-skin-02-selec",
                     "option-skin-3": "option-skin-03-selec",
                     "option-skin-4": "option-skin-04-selec",
                     "option-skin-5": "option-skin-05-selec"]
let selectedLegs = ["option-pants-1": "option-pants-01-selec",
                    "option-pg": "option-pg-selec",
                    "option-wheelchair": "option-wheelchair-selec"]

var cat = CategoriaSelecionada(categoriaSelectionada: .skin)

extension CreateFriendViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch cat.getCategoriaSelecionada() {
        case .skin:
            return selectedSkins.count
        case .head:
            return selectedShirts.count
        case .shirt:
            return selectedShirts.count
        default:
            return selectedLegs.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = partsCollectionView.dequeueReusableCell(
                    withReuseIdentifier: "cell",
                    for: indexPath) as? ColorsCollectionViewCell else { return UICollectionViewCell() }
        
        switch cat.getCategoriaSelecionada() {
        
        case .skin:
            guard let key = getKey(of: selectedSkins, at: indexPath.row) else { return UICollectionViewCell() }
            cell.partImage.image = UIImage(named: key)
            
        case .head:
            guard let key = getKey(of: selectedShirts, at: indexPath.row) else { return UICollectionViewCell() }
            cell.partImage.image = UIImage(named: key)
            
        case .shirt:
            guard let key = getKey(of: selectedShirts, at: indexPath.row) else { return UICollectionViewCell() }
            cell.partImage.image = UIImage(named: key)
            
        default:
            guard let key = getKey(of: selectedLegs, at: indexPath.row) else { return UICollectionViewCell() }
            cell.partImage.image = UIImage(named: key)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard let cell = partsCollectionView.dequeueReusableCell(
                    withReuseIdentifier: "cell",
                    for: indexPath) as? ColorsCollectionViewCell else { return }
        
        switch cat.getCategoriaSelecionada() {
        
        case .skin:
            guard let deselectedPart = getKey(of: selectedSkins, at: indexPath.row)
            else { return }
            guard let selectedPart = getValue(of: selectedSkins, at: indexPath.row)
            else { return }
            
            if cell.isSelected {
                cell.partImage.image = UIImage(named: selectedPart)
            } else {
                cell.partImage.image = UIImage(named: deselectedPart)
            }
            
        case .head:
            guard let deselectedPart = getKey(of: selectedSkins, at: indexPath.row)
            else { return }
            guard let selectedPart = getValue(of: selectedSkins, at: indexPath.row)
            else { return }
            
            if cell.isSelected {
                cell.partImage.image = UIImage(named: selectedPart)
            } else {
                cell.partImage.image = UIImage(named: deselectedPart)
            }
            
        case .shirt:
            guard let deselectedPart = getKey(of: selectedShirts, at: indexPath.row)
            else { return }
            guard let selectedPart = getValue(of: selectedShirts, at: indexPath.row)
            else { return }
            
            if cell.isSelected {
                cell.partImage.image = UIImage(named: selectedPart)
            } else {
                cell.partImage.image = UIImage(named: deselectedPart)
            }
            
        default:
            guard let deselectedPart = getKey(of: selectedLegs, at: indexPath.row)
            else { return }
            guard let selectedPart = getValue(of: selectedLegs, at: indexPath.row)
            else { return }
            
            if cell.isSelected {
                cell.partImage.image = UIImage(named: selectedPart)
            } else {
                cell.partImage.image = UIImage(named: deselectedPart)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let currentCell = collectionView.cellForItem(at: indexPath) as? ColorsCollectionViewCell else { return }
        currentCell.isSelected = true
        
        switch cat.getCategoriaSelecionada() {
        
        case .skin:
            guard let selectedPart = getValue(of: selectedSkins, at: indexPath.row)
            else { return }
            currentCell.partImage.image = UIImage(named: selectedPart)
            self.skinImage.image = UIImage(named: skinFriend[indexPath.row])
            
        case .head:
            guard let selectedPart = getValue(of: selectedSkins, at: indexPath.row)
            else { return }
            currentCell.partImage.image = UIImage(named: selectedPart)
            
        case .shirt:
            guard let selectedPart = getValue(of: selectedShirts, at: indexPath.row)
            else { return }
            currentCell.partImage.image = UIImage(named: selectedPart)
            self.shirtImage.image = UIImage(named: shirtFriend[indexPath.row])
            
        default:
            guard let selectedPart = getValue(of: selectedLegs, at: indexPath.row)
            else { return }
            currentCell.partImage.image = UIImage(named: selectedPart)
            self.legsImage.image = UIImage(named: legsFriend[indexPath.row])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        guard let currentCell = collectionView.cellForItem(at: indexPath) as? ColorsCollectionViewCell else { return }
        currentCell.isSelected = false
        
        switch cat.getCategoriaSelecionada() {
        
        case .skin:
            guard let deselectedPart = getKey(of: selectedSkins, at: indexPath.row)
            else { return }
            currentCell.partImage.image = UIImage(named: deselectedPart)
            
        case .head:
            guard let deselectedPart = getKey(of: selectedSkins, at: indexPath.row)
            else { return }
            currentCell.partImage.image = UIImage(named: deselectedPart)
            
        case .shirt:
            guard let deselectedPart = getKey(of: selectedShirts, at: indexPath.row)
            else { return }
            currentCell.partImage.image = UIImage(named: deselectedPart)
            
        default:
            guard let deselectedPart = getKey(of: selectedLegs, at: indexPath.row)
            else { return }
            currentCell.partImage.image = UIImage(named: deselectedPart)
        }
    }
}

extension CreateFriendViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 56, height: 56)
    }
    
}
