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
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupFriendViewConstraints()
        setupSkinImageConstraints()
        setupLegsImageConstraints()
        setupShirtImageConstraints()
        setupHeadImageConstraints()
    }
    
    // Friend
    func setupFriendViewConstraints() {
        NSLayoutConstraint.activate([
            friendView.widthAnchor.constraint(equalToConstant: 110.27),
            friendView.heightAnchor.constraint(equalToConstant: 199),
            friendView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
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

}
