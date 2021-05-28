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
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupFriendViewConstraints()
    }
    
    // Header
    func setupFriendViewConstraints() {
        NSLayoutConstraint.activate([
            friendView.widthAnchor.constraint(equalToConstant: 110.27),
            friendView.heightAnchor.constraint(equalToConstant: 199),
            friendView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            friendView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }

}
