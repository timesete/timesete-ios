//
//  ArticlesConstraints.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 01/06/21.
//

import UIKit

extension ArticlesViewController {
    
    // MARK: Subviews
    func addSubviews() {
        self.view.addSubview(headerView)
        self.headerView.addSubview(profileButton)
        self.headerView.addSubview(navLabel)
        
        self.view.addSubview(articlesTableView)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupHeaderViewConstraints()
        setupProfileButtonConstraints()
        setupNavLabelConstraints()
        
        setupArticlesTableViewConstraints()
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
    
    // Main
    func setupArticlesTableViewConstraints() {
        NSLayoutConstraint.activate([
            articlesTableView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor),
            articlesTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            articlesTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            articlesTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
