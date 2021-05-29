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
        self.view.addSubview(friendView)
        self.friendView.addSubview(skinImage)
        self.friendView.insertSubview(legsImage, aboveSubview: skinImage)
        self.friendView.insertSubview(shirtImage, aboveSubview: legsImage)
        self.friendView.insertSubview(headImage, aboveSubview: shirtImage)
        
        self.view.addSubview(partsView)
        self.partsView.addSubview(partsCategoriesView)
        self.partsView.addSubview(bottomView)
        self.bottomView.addSubview(createFriendButton)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupFriendViewConstraints()
        setupSkinImageConstraints()
        setupLegsImageConstraints()
        setupShirtImageConstraints()
        setupHeadImageConstraints()
        
        setupPartsViewConstraints()
        setupPartsCategoriesViewConstraints()
        setupBottomViewConstraints()
        setupCreateFriendButtonConstraints()
    }
    
    // Friend created
    func setupFriendViewConstraints() {
        NSLayoutConstraint.activate([
            friendView.widthAnchor.constraint(equalToConstant: 110.27),
            friendView.heightAnchor.constraint(equalToConstant: 199),
//            friendView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            friendView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            friendView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
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
