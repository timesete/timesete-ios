//
//  CreateFriendConstraints.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 28/05/21.
//

import UIKit

extension CreateFriendViewController {
    
    // MARK: Subviews
    func addSubviews() {
        self.view.addSubview(headerView)
        self.headerView.addSubview(navStackView)
        self.navStackView.addArrangedSubview(navLabel)
        self.navStackView.addArrangedSubview(navCloseButton)
        self.view.addSubview(auxiliaryView)
        
        self.view.insertSubview(friendView, aboveSubview: auxiliaryView)
        self.friendView.addSubview(skinImage)
        self.friendView.insertSubview(legsImage, aboveSubview: skinImage)
        self.friendView.insertSubview(shirtImage, aboveSubview: legsImage)
        self.friendView.insertSubview(headImage, aboveSubview: shirtImage)
        
        self.view.addSubview(partsView)
        self.partsView.addSubview(partsCategoriesView)
        self.partsCategoriesView.addSubview(partsCategoriesStackView)
        self.partsCategoriesStackView.addArrangedSubview(skinButton)
        self.partsCategoriesStackView.addArrangedSubview(headButton)
        self.partsCategoriesStackView.addArrangedSubview(shirtButton)
        self.partsCategoriesStackView.addArrangedSubview(legsButton)
        
        self.view.addSubview(optionsStackView)
        self.optionsStackView.addArrangedSubview(colorsStackView)
        self.optionsStackView.addArrangedSubview(partsCollectionView)
        
        self.colorsStackView.addArrangedSubview(brownColorButton)
        self.colorsStackView.addArrangedSubview(blackColorButton)
        self.colorsStackView.addArrangedSubview(blondColorButton)
        self.colorsStackView.addArrangedSubview(redColorButton)
        
        self.partsView.addSubview(bottomView)
        self.bottomView.addSubview(createFriendButton)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupHeaderViewConstraints()
        setupNavStackViewConstraints()
        setupAuxiliaryViewConstraints()
        
        setupFriendViewConstraints()
        setupSkinImageConstraints()
        setupLegsImageConstraints()
        setupShirtImageConstraints()
        setupHeadImageConstraints()
        
        setupPartsViewConstraints()
        setupPartsCategoriesViewConstraints()
        setupPartsCategoriesSatckViewConstraints()
        
        setupOptionsStackViewConstrains()
        setupColorsStackViewConstraints()
        setupPartsCollectionViewConstraints()
        
        setupBottomViewConstraints()
        setupCreateFriendButtonConstraints()
    }
    
    // Header
    func setupHeaderViewConstraints() {
        let headerHeight = self.view.notchHeight + 116
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            headerView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            headerView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            headerView.heightAnchor.constraint(equalToConstant: headerHeight)
        ])
    }
    
    func setupNavStackViewConstraints() {
        NSLayoutConstraint.activate([
            navStackView.rightAnchor.constraint(equalTo: self.headerView.rightAnchor, constant: -24),
            navStackView.leftAnchor.constraint(equalTo: self.headerView.leftAnchor, constant: 24),
            navStackView.bottomAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: -16),
            navStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupAuxiliaryViewConstraints() {
        NSLayoutConstraint.activate([
            auxiliaryView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor),
            auxiliaryView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            auxiliaryView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            auxiliaryView.bottomAnchor.constraint(equalTo: self.partsView.topAnchor)
        ])
    }
    
    // Friend created
    func setupFriendViewConstraints() {
        NSLayoutConstraint.activate([
            friendView.widthAnchor.constraint(equalToConstant: 110.27),
            friendView.heightAnchor.constraint(equalToConstant: 199),
            friendView.centerXAnchor.constraint(equalTo: self.auxiliaryView.centerXAnchor),
            friendView.centerYAnchor.constraint(equalTo: self.auxiliaryView.centerYAnchor)
        ])
    }
    
    func setupSkinImageConstraints() {
        NSLayoutConstraint.activate([
            skinImage.heightAnchor.constraint(equalToConstant: 117),
            skinImage.topAnchor.constraint(equalTo: self.friendView.topAnchor, constant: 27),
            skinImage.leftAnchor.constraint(equalTo: self.friendView.leftAnchor, constant: 16),
            skinImage.rightAnchor.constraint(equalTo: self.friendView.rightAnchor, constant: -27)
        ])
    }
    
    func setupLegsImageConstraints() {
        NSLayoutConstraint.activate([
            legsImage.topAnchor.constraint(equalTo: self.friendView.topAnchor, constant: 30),
            legsImage.bottomAnchor.constraint(equalTo: self.friendView.bottomAnchor),
            legsImage.leftAnchor.constraint(equalTo: self.friendView.leftAnchor),
            legsImage.rightAnchor.constraint(equalTo: self.friendView.rightAnchor)
        ])
    }
    
    func setupShirtImageConstraints() {
        NSLayoutConstraint.activate([
            shirtImage.heightAnchor.constraint(equalToConstant: 56),
            shirtImage.topAnchor.constraint(equalTo: self.friendView.topAnchor, constant: 73.5),
            shirtImage.leftAnchor.constraint(equalTo: self.friendView.leftAnchor, constant: 17),
            shirtImage.rightAnchor.constraint(equalTo: self.friendView.rightAnchor, constant: -36)
        ])
    }
    
    func setupHeadImageConstraints() {
        NSLayoutConstraint.activate([
            headImage.heightAnchor.constraint(equalToConstant: 81),
            headImage.topAnchor.constraint(equalTo: self.friendView.topAnchor),
            headImage.leftAnchor.constraint(equalTo: self.friendView.leftAnchor, constant: 11.09),
            headImage.rightAnchor.constraint(equalTo: self.friendView.rightAnchor, constant: -24.21)
        ])
    }
    
    // Parts
    func setupPartsViewConstraints() {
        NSLayoutConstraint.activate([
            partsView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0/2),
            partsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            partsView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            partsView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    func setupPartsCategoriesViewConstraints() {
        NSLayoutConstraint.activate([
            partsCategoriesView.heightAnchor.constraint(equalToConstant: 96),
            partsCategoriesView.topAnchor.constraint(equalTo: self.partsView.topAnchor),
            partsCategoriesView.leftAnchor.constraint(equalTo: self.partsView.leftAnchor),
            partsCategoriesView.rightAnchor.constraint(equalTo: self.partsView.rightAnchor)
        ])
    }
    
    func setupPartsCategoriesSatckViewConstraints() {
        NSLayoutConstraint.activate([
            partsCategoriesStackView.topAnchor.constraint(equalTo: self.partsCategoriesView.topAnchor, constant: 16),
            partsCategoriesStackView.bottomAnchor.constraint(equalTo: self.partsCategoriesView.bottomAnchor, constant: -16),
            partsCategoriesStackView.leftAnchor.constraint(equalTo: self.partsCategoriesView.leftAnchor, constant: 16),
            partsCategoriesStackView.rightAnchor.constraint(equalTo: self.partsCategoriesView.rightAnchor, constant: -16)
        ])
    }
    
    func setupOptionsStackViewConstrains() {
        NSLayoutConstraint.activate([
            optionsStackView.topAnchor.constraint(equalTo: self.partsCategoriesView.bottomAnchor, constant: 16),
            optionsStackView.leftAnchor.constraint(equalTo: self.partsView.leftAnchor, constant: 16),
            optionsStackView.rightAnchor.constraint(equalTo: self.partsView.rightAnchor, constant: -16),
            optionsStackView.bottomAnchor.constraint(equalTo: self.bottomView.topAnchor)
        ])
    }
    
    func setupColorsStackViewConstraints() {
        NSLayoutConstraint.activate([
            colorsStackView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    func setupPartsCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            partsCollectionView.rightAnchor.constraint(equalTo: optionsStackView.rightAnchor),
            partsCollectionView.leftAnchor.constraint(equalTo: optionsStackView.leftAnchor),
            partsCollectionView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func setupPartsCollectionViewSecondConstraints() {
        NSLayoutConstraint.activate([
            partsCollectionView.topAnchor.constraint(equalTo: self.colorsStackView.bottomAnchor, constant: 16),
            partsCollectionView.leftAnchor.constraint(equalTo: self.partsView.leftAnchor),
            partsCollectionView.rightAnchor.constraint(equalTo: self.partsView.rightAnchor),
            partsCollectionView.bottomAnchor.constraint(equalTo: self.bottomView.topAnchor)
        ])
    }
    
    func setupBottomViewConstraints() {
        let bottomViewHeight = self.view.notchHeight + 84
        
        NSLayoutConstraint.activate([
            bottomView.heightAnchor.constraint(equalToConstant: bottomViewHeight),
            bottomView.bottomAnchor.constraint(equalTo: self.partsView.bottomAnchor),
            bottomView.leftAnchor.constraint(equalTo: self.partsView.leftAnchor),
            bottomView.rightAnchor.constraint(equalTo: self.partsView.rightAnchor)
        ])
    }
    
    func setupCreateFriendButtonConstraints() {
        NSLayoutConstraint.activate([
            createFriendButton.topAnchor.constraint(equalTo: self.bottomView.topAnchor, constant: 10),
            createFriendButton.centerXAnchor.constraint(equalTo: self.bottomView.centerXAnchor)
        ])
    }
}
