//
//  SignUpConstraints.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 23/05/21.
//

import UIKit

extension SignUpViewController {
    
    // MARK: Subviews
    func addSubviews() {
        self.view.addSubview(headerStackView)
        self.headerStackView.addArrangedSubview(titleLabel)
        self.headerStackView.addArrangedSubview(pageImage)
        
        self.view.addSubview(signUpStackView)
        self.emailView.addSubview(emailTextField)
        self.emailView.addSubview(emailErrorImage)
        self.signUpStackView.addArrangedSubview(emailLabel)
        self.signUpStackView.addArrangedSubview(emailView)
        self.signUpStackView.addArrangedSubview(emailWarningLabel)
        self.passwordView.addSubview(passwordTextField)
        self.passwordView.addSubview(passwordErrorImage)
        self.passwordView.insertSubview(showPasswordButton,
                                        belowSubview: passwordErrorImage)
        self.signUpStackView.addArrangedSubview(passwordLabel)
        self.signUpStackView.addArrangedSubview(passwordView)
        self.signUpStackView.addArrangedSubview(passwordWarningLabel)
        self.confirmPasswordView.addSubview(confirmPasswordTextField)
        self.confirmPasswordView.addSubview(showConfirmPasswordButton)
        self.signUpStackView.addArrangedSubview(confirmPasswordLabel)
        self.signUpStackView.addArrangedSubview(confirmPasswordView)
        self.signUpStackView.addArrangedSubview(confirmPasswordWarningLabel)
        
        self.view.addSubview(proceedButton)
        self.view.addSubview(signInStackView)
        self.signInStackView.addArrangedSubview(signInLabel)
        self.signInStackView.addArrangedSubview(signInButton)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupHeaderStackViewConstraints()
        setupSignUpStackViewConstraints()
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
        setupSignInStackViewConstraints()
        
        self.signUpStackView.setCustomSpacing(8, after: self.emailLabel)
        self.signUpStackView.setCustomSpacing(20, after: self.emailWarningLabel)
        self.signUpStackView.setCustomSpacing(8, after: self.passwordLabel)
        self.signUpStackView.setCustomSpacing(20, after: self.passwordWarningLabel)
        self.signUpStackView.setCustomSpacing(8, after: self.confirmPasswordLabel)
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
    func setupSignUpStackViewConstraints() {
        NSLayoutConstraint.activate([
            signUpStackView.topAnchor.constraint(equalTo: self.headerStackView.bottomAnchor, constant: 24),
            signUpStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24),
            signUpStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -24)
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
            proceedButton.bottomAnchor.constraint(equalTo: self.signInStackView.topAnchor, constant: -68),
            proceedButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    func setupSignInStackViewConstraints() {
        NSLayoutConstraint.activate([
            signInStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            signInStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
}
