//
//  SecondRecoverPasswordConstraints.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 24/05/21.
//

import UIKit

extension SecondRecoverPasswordViewController {
    
    // MARK: Subviews
    func addSubviews() {
        self.view.addSubview(headerStackView)
        self.headerStackView.addArrangedSubview(titleLabel)
        self.headerStackView.addArrangedSubview(pageImage)
        self.view.insertSubview(pageOneButton, aboveSubview: headerStackView)
        
        self.view.addSubview(newPasswordStackView)
        self.answerView.addSubview(answerTextField)
        self.answerView.addSubview(answerErrorImage)
        self.newPasswordStackView.addArrangedSubview(questionLabel)
        self.newPasswordStackView.addArrangedSubview(answerView)
        self.newPasswordStackView.addArrangedSubview(answerWarningLabel)
        self.passwordView.addSubview(passwordTextField)
        self.passwordView.addSubview(passwordErrorImage)
        self.passwordView.insertSubview(showPasswordButton,
                                        belowSubview: passwordErrorImage)
        self.newPasswordStackView.addArrangedSubview(passwordLabel)
        self.newPasswordStackView.addArrangedSubview(passwordView)
        self.newPasswordStackView.addArrangedSubview(passwordWarningLabel)
        self.confirmPasswordView.addSubview(confirmPasswordTextField)
        self.confirmPasswordView.addSubview(showConfirmPasswordButton)
        self.newPasswordStackView.addArrangedSubview(confirmPasswordLabel)
        self.newPasswordStackView.addArrangedSubview(confirmPasswordView)
        self.newPasswordStackView.addArrangedSubview(confirmPasswordWarningLabel)
        
        self.view.addSubview(recoverPasswordButton)
        self.view.addSubview(cancelButton)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupHeaderStackViewConstraints()
        setupPageOneButtonConstraints()
        
        setupNewPasswordStackViewConstraints()
        setupEmailViewConstraints()
        setupEmailErrorImageConstraints()
        setupEmailTextFieldConstraints()
        setupPasswordViewConstraints()
        setupPasswordErrorImageConstraints()
        setupShowPasswordButtonConstraints()
        setupPasswordTextFieldConstraints()
        setupConfirmPasswordViewConstraints()
        setupShowConfirmPasswordButtonConstraints()
        setupConfirmPasswordTextFieldConstraints()
        
        setupProceedButtonConstraints()
        setupCancelButtonConstraints()
        
        self.newPasswordStackView.setCustomSpacing(8, after: self.questionLabel)
        self.newPasswordStackView.setCustomSpacing(20, after: self.answerWarningLabel)
        self.newPasswordStackView.setCustomSpacing(8, after: self.passwordLabel)
        self.newPasswordStackView.setCustomSpacing(20, after: self.passwordWarningLabel)
        self.newPasswordStackView.setCustomSpacing(8, after: self.confirmPasswordLabel)
    }
    
    // Header
    func setupHeaderStackViewConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
            headerStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24),
            headerStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -24)
        ])
    }
    
    func setupPageOneButtonConstraints() {
        guard let viewWidth = self.presenter.getViewWidth() else { return }
        
        NSLayoutConstraint.activate([
            pageOneButton.bottomAnchor.constraint(equalTo: self.headerStackView.bottomAnchor),
            pageOneButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -viewWidth/2),
            pageOneButton.heightAnchor.constraint(equalTo: self.pageImage.heightAnchor),
            pageOneButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    // Main
    func setupNewPasswordStackViewConstraints() {
        NSLayoutConstraint.activate([
            newPasswordStackView.topAnchor.constraint(equalTo: self.headerStackView.bottomAnchor, constant: 24),
            newPasswordStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24),
            newPasswordStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -24)
        ])
    }
    
    func setupEmailViewConstraints() {
        answerView.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
 
    func setupEmailErrorImageConstraints() {
        NSLayoutConstraint.activate([
            answerErrorImage.heightAnchor.constraint(equalTo: self.answerTextField.heightAnchor),
            answerErrorImage.widthAnchor.constraint(equalTo: self.answerTextField.heightAnchor),
            answerErrorImage.rightAnchor.constraint(equalTo: self.answerView.rightAnchor, constant: -12),
            answerErrorImage.centerYAnchor.constraint(equalTo: self.answerView.centerYAnchor)
        ])
    }
    
    func setupEmailTextFieldConstraints() {
        NSLayoutConstraint.activate([
            answerTextField.rightAnchor.constraint(equalTo: self.answerErrorImage.leftAnchor),
            answerTextField.leftAnchor.constraint(equalTo: self.answerView.leftAnchor, constant: 12),
            answerTextField.topAnchor.constraint(equalTo: self.answerView.topAnchor, constant: 5),
            answerTextField.bottomAnchor.constraint(equalTo: self.answerView.bottomAnchor, constant: -5)
        ])
    }
    
    func setupPasswordViewConstraints() {
        passwordView.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func setupPasswordErrorImageConstraints() {
        NSLayoutConstraint.activate([
            passwordErrorImage.heightAnchor.constraint(equalTo: self.passwordTextField.heightAnchor),
            passwordErrorImage.widthAnchor.constraint(equalTo: self.passwordTextField.heightAnchor),
            passwordErrorImage.rightAnchor.constraint(equalTo: self.passwordView.rightAnchor, constant: -12),
            passwordErrorImage.centerYAnchor.constraint(equalTo: self.passwordView.centerYAnchor)
        ])
    }
    
    func setupShowPasswordButtonConstraints() {
        NSLayoutConstraint.activate([
            showPasswordButton.heightAnchor.constraint(equalTo: self.passwordTextField.heightAnchor),
            showPasswordButton.widthAnchor.constraint(equalTo: self.passwordTextField.heightAnchor),
            showPasswordButton.rightAnchor.constraint(equalTo: self.passwordView.rightAnchor, constant: -12),
            showPasswordButton.centerYAnchor.constraint(equalTo: self.passwordView.centerYAnchor)
        ])
    }
    
    func setupPasswordTextFieldConstraints() {
        NSLayoutConstraint.activate([
            passwordTextField.rightAnchor.constraint(equalTo: self.passwordErrorImage.leftAnchor),
            passwordTextField.leftAnchor.constraint(equalTo: self.passwordView.leftAnchor, constant: 12),
            passwordTextField.topAnchor.constraint(equalTo: self.passwordView.topAnchor, constant: 5),
            passwordTextField.bottomAnchor.constraint(equalTo: self.passwordView.bottomAnchor, constant: -5)
        ])
    }
    
    func setupConfirmPasswordViewConstraints() {
        confirmPasswordView.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func setupShowConfirmPasswordButtonConstraints() {
        NSLayoutConstraint.activate([
            showConfirmPasswordButton.heightAnchor.constraint(equalTo: self.confirmPasswordTextField.heightAnchor),
            showConfirmPasswordButton.widthAnchor.constraint(equalTo: self.confirmPasswordTextField.heightAnchor),
            showConfirmPasswordButton.rightAnchor.constraint(equalTo: self.confirmPasswordView.rightAnchor, constant: -12),
            showConfirmPasswordButton.centerYAnchor.constraint(equalTo: self.confirmPasswordView.centerYAnchor)
        ])
    }
    
    func setupConfirmPasswordTextFieldConstraints() {
        confirmPasswordTextField.rightAnchor.constraint(equalTo: self.showConfirmPasswordButton.leftAnchor).isActive = true
        confirmPasswordTextField.leftAnchor.constraint(equalTo: self.confirmPasswordView.leftAnchor, constant: 12).isActive = true
        confirmPasswordTextField.topAnchor.constraint(equalTo: self.confirmPasswordView.topAnchor, constant: 5).isActive = true
        confirmPasswordTextField.bottomAnchor.constraint(equalTo: self.confirmPasswordView.bottomAnchor, constant: -5).isActive = true
    }
    
    // Footer
    func setupProceedButtonConstraints() {
        NSLayoutConstraint.activate([
            recoverPasswordButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -108),
            recoverPasswordButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    func setupCancelButtonConstraints() {
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: self.recoverPasswordButton.bottomAnchor),
            cancelButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    // Alert
    func setupCustomAlertViewConstraints() {
        NSLayoutConstraint.activate([
            customAlertView.topAnchor.constraint(equalTo: self.view.topAnchor),
            customAlertView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            customAlertView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            customAlertView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
}
