//
//  WorldConstraints.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 31/05/21.
//

import UIKit

extension WorldViewController {
    
    // MARK: Subviews
    func addSubviews() {
        self.view.addSubview(headerView)
        self.headerView.addSubview(profileButton)
        self.headerView.addSubview(navLabel)
        self.view.addSubview(messageView)
        self.messageView.addSubview(messageLabel)

        self.view.insertSubview(sceneryImage, belowSubview: headerView)
        self.view.insertSubview(friend01Button, aboveSubview: sceneryImage)
        self.view.insertSubview(friend02Button, aboveSubview: sceneryImage)
        self.view.insertSubview(friend03Button, aboveSubview: sceneryImage)
        self.view.insertSubview(myFriendButton, aboveSubview: sceneryImage)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupHeaderViewConstraints()
        setupProfileButtonConstraints()
        setupNavLabelConstraints()
        
        setupMessageViewConstraints()
        setupMessageLabelConstraints()
        
        setupSceneryImageConstraints()
        setupFriend01ButtonConstraints()
        setupFriend02ButtonConstraints()
        setupFriend03ButtonConstraints()
        setupMyFriendButtonConstraints()
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
    
    func setupProfileButtonConstraints() {
        NSLayoutConstraint.activate([
            profileButton.leftAnchor.constraint(equalTo: self.headerView.leftAnchor, constant: 8),
            profileButton.bottomAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: 12),
            profileButton.heightAnchor.constraint(equalToConstant: 80),
            profileButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func setupNavLabelConstraints() {
        NSLayoutConstraint.activate([
            navLabel.rightAnchor.constraint(equalTo: self.headerView.rightAnchor, constant: -24),
            navLabel.leftAnchor.constraint(equalTo: self.profileButton.rightAnchor, constant: -6),
            navLabel.bottomAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: -20)
        ])
    }
    
    func setupMessageViewConstraints() {
        NSLayoutConstraint.activate([
            messageView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor),
            messageView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            messageView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            messageView.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
    
    func setupMessageLabelConstraints() {
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: self.messageView.centerYAnchor),
            messageLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -24),
            messageLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24)
        ])
    }
    
    // Main
    func setupSceneryImageConstraints() {
        NSLayoutConstraint.activate([
            sceneryImage.topAnchor.constraint(equalTo: self.headerView.bottomAnchor),
            sceneryImage.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            sceneryImage.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            sceneryImage.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupFriend01ButtonConstraints() {
        guard let viewHeight = self.presenter.getViewHeight()
        else { return }
        
        NSLayoutConstraint.activate([
            friend01Button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: viewHeight * -0.2),
            friend01Button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 111),
            friend01Button.heightAnchor.constraint(equalToConstant: 180),
            friend01Button.widthAnchor.constraint(equalToConstant: 106.5)
        ])
    }
    
    func setupFriend02ButtonConstraints() {
        guard let viewHeight = self.presenter.getViewHeight()
        else { return }
        
        NSLayoutConstraint.activate([
            friend02Button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: viewHeight * -0.3),
            friend02Button.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -41.8),
            friend02Button.heightAnchor.constraint(equalToConstant: 180),
            friend02Button.widthAnchor.constraint(equalToConstant: 106.5)
        ])
    }
    
    func setupFriend03ButtonConstraints() {
        NSLayoutConstraint.activate([
            friend03Button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -17),
            friend03Button.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -33.8),
            friend03Button.heightAnchor.constraint(equalToConstant: 180),
            friend03Button.widthAnchor.constraint(equalToConstant: 106.5)
        ])
    }
    
    func setupMyFriendButtonConstraints() {
        NSLayoutConstraint.activate([
            myFriendButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            myFriendButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 33.8),
            myFriendButton.heightAnchor.constraint(equalToConstant: 180),
            myFriendButton.widthAnchor.constraint(equalToConstant: 106.5)
        ])
    }
    
}
