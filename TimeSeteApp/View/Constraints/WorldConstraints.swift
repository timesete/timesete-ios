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
        self.headerView.addSubview(navStackView)
        self.navStackView.addArrangedSubview(profileButton)
        self.navStackView.addArrangedSubview(navLabel)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupHeaderViewConstraints()
        setupNavStackViewConstraints()
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
}
