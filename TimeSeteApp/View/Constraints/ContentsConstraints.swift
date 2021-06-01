//
//  ContentsConstraints.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 01/06/21.
//

import UIKit

extension ContentsViewController {
    
    // MARK: Subviews
    func addSubviews() {
        self.view.addSubview(headerView)
        self.headerView.addSubview(backButton)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupHeaderViewConstraints()
        setupBackButtonConstraints()
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

    func setupBackButtonConstraints() {
        NSLayoutConstraint.activate([
            backButton.leftAnchor.constraint(equalTo: self.headerView.leftAnchor, constant: 8),
            backButton.bottomAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: 12),
            backButton.heightAnchor.constraint(equalToConstant: 80),
            backButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }

}
