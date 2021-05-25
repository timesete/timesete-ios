//
//  RecoverPasswordConstraints.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 24/05/21.
//

import UIKit

extension RecoverPasswordViewController {
    
    // MARK: Subviews
    func addSubviews() {
        self.view.addSubview(headerStackView)
        self.headerStackView.addArrangedSubview(titleLabel)
        self.headerStackView.addArrangedSubview(pageImage)
        
        self.view.addSubview(recoverPasswordStackView)
        self.emailView.addSubview(emailTextField)
        self.emailView.addSubview(emailErrorImage)
        self.recoverPasswordStackView.addArrangedSubview(emailLabel)
        self.recoverPasswordStackView.addArrangedSubview(emailView)
        self.recoverPasswordStackView.addArrangedSubview(emailWarningLabel)
        
        self.view.addSubview(proceedButton)
        self.view.addSubview(cancelButton)
    }

    // MARK: Setup Constraints
    func setupConstraints() {
        setupHeaderStackViewConstraints()
        setupRecoverPasswordStackViewConstraints()
        setupEmailViewConstraints()
        setupEmailErrorImageConstraints()
        setupEmailTextFieldConstraints()
        
        setupProceedButtonConstraints()
        setupCancelButtonConstraints()
        
        self.recoverPasswordStackView.setCustomSpacing(8, after: self.emailLabel)
        self.recoverPasswordStackView.setCustomSpacing(20, after: self.emailWarningLabel)
    }

    // Header
    func setupHeaderStackViewConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
            headerStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24),
            headerStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -24)
        ])
    }

    // Main
    func setupRecoverPasswordStackViewConstraints() {
        NSLayoutConstraint.activate([
            recoverPasswordStackView.topAnchor.constraint(equalTo: self.headerStackView.bottomAnchor, constant: 24),
            recoverPasswordStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24),
            recoverPasswordStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -24)
        ])
    }

    func setupEmailViewConstraints() {
        emailView.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }

    func setupEmailErrorImageConstraints() {
        NSLayoutConstraint.activate([
            emailErrorImage.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            emailErrorImage.widthAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            emailErrorImage.rightAnchor.constraint(equalTo: self.emailView.rightAnchor, constant: -12),
            emailErrorImage.centerYAnchor.constraint(equalTo: self.emailView.centerYAnchor)
        ])
    }

    func setupEmailTextFieldConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.rightAnchor.constraint(equalTo: self.emailErrorImage.leftAnchor),
            emailTextField.leftAnchor.constraint(equalTo: self.emailView.leftAnchor, constant: 12),
            emailTextField.topAnchor.constraint(equalTo: self.emailView.topAnchor, constant: 5),
            emailTextField.bottomAnchor.constraint(equalTo: self.emailView.bottomAnchor, constant: -5)
        ])
    }
    
    // Footer
    func setupProceedButtonConstraints() {
        NSLayoutConstraint.activate([
            proceedButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -108),
            proceedButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    func setupCancelButtonConstraints() {
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: self.proceedButton.bottomAnchor),
            cancelButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }

}
