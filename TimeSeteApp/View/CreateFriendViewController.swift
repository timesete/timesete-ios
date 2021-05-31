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
        cat.setCategoriaSelecionada(categoriaSelectionada: .skin)
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
        colorsCollectionView.register(ColorsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
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
    
    // MARK: Actions
    
    // Parts
    @objc func skinAction(sender: UIButton) {
        sender.isSelected = true
        headButton.isSelected = false
        shirtButton.isSelected = false
        legsButton.isSelected = false
        
        colorsStackView.isHidden = true
        cat.setCategoriaSelecionada(categoriaSelectionada: .skin)
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
        cat.setCategoriaSelecionada(categoriaSelectionada: .head)
        partsCollectionView.reloadData()
    }
    
    @objc func shirtAction(sender: UIButton) {
        sender.isSelected  = true
        skinButton.isSelected = false
        headButton.isSelected = false
        legsButton.isSelected = false
        
        colorsStackView.isHidden = true
        cat.setCategoriaSelecionada(categoriaSelectionada: .shirt)
        partsCollectionView.reloadData()
    }
    
    @objc func legsAction(sender: UIButton) {
        sender.isSelected = true
        skinButton.isSelected = false
        headButton.isSelected = false
        shirtButton.isSelected = false
        
        colorsStackView.isHidden = true
        cat.setCategoriaSelecionada(categoriaSelectionada: .legs)
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
        // criar amigo
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

enum HairColor {
    case brown
    case black
    case blond
    case red
}

struct SelectedHairColor {
    var selectedHairColor: HairColor

    init(selectedHairColor: HairColor) {
        self.selectedHairColor = selectedHairColor
    }
    
    func getSelectedHairColor() -> HairColor {
        selectedHairColor
    }
    
    mutating func setSelectedHairColor(selectedHairColor: HairColor) {
        self.selectedHairColor = selectedHairColor
    }
}

var hairColor = SelectedHairColor(selectedHairColor: .brown)

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
let brownHairFriend = ["brown-hair-1", "brown-hair-2",
                       "brown-hair-3", "hijab"]
let blackHairFriend = ["black-hair-1", "black-hair-2",
                       "black-hair-3", "hijab"]
let blondHairFriend = ["blond-hair-1", "blond-hair-2",
                       "blond-hair-3", "hijab"]
let redHairFriend = ["red-hair-1", "red-hair-2", "red-hair-3", "hijab"]

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
let selectedHair = ["option-hair-1": "option-hair-01-selec",
                      "option-hair-2": "option-hair-02-selec",
                      "option-hair-3": "option-hair-03-selec",
                      "option-hijab": "option-hijab-selec"]

var cat = CategoriaSelecionada(categoriaSelectionada: .skin)

extension CreateFriendViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch cat.getCategoriaSelecionada() {
        case .skin:
            return selectedSkins.count
        case .head:
            return selectedHair.count
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
            print(indexPath.row)
            print(key)
            cell.partImage.image = UIImage(named: key)
            
        case .head:
            guard let key = getKey(of: selectedHair, at: indexPath.row) else { return UICollectionViewCell() }
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
        
        guard let cell = cell as? ColorsCollectionViewCell else { return }
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
            guard let deselectedPart = getKey(of: selectedHair, at: indexPath.row)
            else { return }
            guard let selectedPart = getValue(of: selectedHair, at: indexPath.row)
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
            guard let selectedPart = getValue(of: selectedHair, at: indexPath.row)
            else { return }
            currentCell.partImage.image = UIImage(named: selectedPart)
            self.headImage.image = verifyHair(index: indexPath.row)
            
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
            guard let deselectedPart = getKey(of: selectedHair, at: indexPath.row)
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
        
        let selectedCategory = cat.getCategoriaSelecionada()
        if selectedCategory == .legs {
            return CGSize(width: 88, height: 88)
        }
        
        return CGSize(width: 56, height: 56)
    }
    
}
