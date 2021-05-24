//
//  LoginConstraints.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 23/05/21.
//

import UIKit

extension LoginViewController {
    
    // MARK: Subviews
    func addSubviews() {
       
        self.view.addSubview(logoImage)
        self.view.addSubview(loginStackView)
        self.emailView.addSubview(emailTextField)
        self.emailView.addSubview(emailErrorImage)
        self.loginStackView.addArrangedSubview(emailLabel)
        self.loginStackView.addArrangedSubview(emailView)
        self.loginStackView.addArrangedSubview(emailWarningLabel)
        self.passwordView.addSubview(passwordTextField)
        self.passwordView.addSubview(passwordErrorImage)
        self.passwordView.insertSubview(showPasswordButton,
                                        belowSubview: passwordErrorImage)
        self.loginStackView.addArrangedSubview(passwordLabel)
        self.loginStackView.addArrangedSubview(passwordView)
        self.loginStackView.addArrangedSubview(passwordWarningLabel)
        self.loginStackView.addArrangedSubview(forgotPasswordButton)
        
        self.view.addSubview(signInButton)
        self.view.addSubview(skipButton)
        self.view.addSubview(signInStackView)
        self.signInStackView.addArrangedSubview(signUpLabel)
        self.signInStackView.addArrangedSubview(signUpButton)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupLogoImageConstraints()
        setupLoginStackViewConstraints()
        setupEmailViewConstraints()
        setupEmailErrorImageConstraints()
        setupEmailTextFieldConstraints()
        setupPasswordViewConstraints()
        setupPasswordErrorImageConstraints()
        setupShowPasswordButtonConstraints()
        setupPasswordTextFieldConstraints()
        setupSignInButtonConstraints()
        setupSkipButtonConstraints()
        setupSignInStackViewConstraints()
        
        self.loginStackView.setCustomSpacing(8, after: self.emailLabel)
        self.loginStackView.setCustomSpacing(20, after: self.emailWarningLabel)
        self.loginStackView.setCustomSpacing(8, after: self.passwordLabel)
    }
    
    // Header
    func setupLogoImageConstraints() {
        logoImage.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        logoImage.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        logoImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
    }
    
    // Main
    func setupLoginStackViewConstraints() {
        NSLayoutConstraint.activate([
            loginStackView.topAnchor.constraint(equalTo: self.logoImage.bottomAnchor, constant: 80),
            loginStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24),
            loginStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -24)
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
    
    // Footer
    func setupSignInButtonConstraints() {
        NSLayoutConstraint.activate([
            signInButton.bottomAnchor.constraint(equalTo: self.signInStackView.topAnchor, constant: -68),
            signInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    func setupSkipButtonConstraints() {
        NSLayoutConstraint.activate([
            skipButton.topAnchor.constraint(equalTo: self.signInButton.bottomAnchor),
            skipButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    func setupSignInStackViewConstraints() {
        NSLayoutConstraint.activate([
            signInStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            signInStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
}
