//
//  PartsCollectionViewController.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 01/06/21.
//

import UIKit

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
                       "brown-hair-3", "hairless", "hijab"]
let blackHairFriend = ["black-hair-1", "black-hair-2",
                       "black-hair-3", "hairless", "hijab"]
let blondHairFriend = ["blond-hair-1", "blond-hair-2",
                       "blond-hair-3", "hairless", "hijab"]
let redHairFriend = ["red-hair-1", "red-hair-2", "red-hair-3", "hairless", "hijab"]

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
                      "option-hairless": "option-hairless-selec",
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
                    for: indexPath) as? PartsCollectionViewCell else { return UICollectionViewCell() }
        
        switch cat.getCategoriaSelecionada() {
        
        case .skin:
            guard let key = getKey(of: selectedSkins, at: indexPath.row) else { return UICollectionViewCell() }
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
        
        guard let cell = cell as? PartsCollectionViewCell else { return }
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
        guard let currentCell = collectionView.cellForItem(at: indexPath) as? PartsCollectionViewCell else { return }
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
        
        guard let currentCell = collectionView.cellForItem(at: indexPath) as? PartsCollectionViewCell else { return }
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
