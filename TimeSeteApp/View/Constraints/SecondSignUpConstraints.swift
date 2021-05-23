//
//  SecondSignUpConstraints.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 23/05/21.
//

import UIKit

extension SecondSignUpViewController {
    
    // MARK: Subviews
    func addSubviews() {
        self.view.addSubview(headerStackView)
        self.headerStackView.addArrangedSubview(titleLabel)
        self.headerStackView.addArrangedSubview(pageImage)
        self.view.insertSubview(pageOneButton, aboveSubview: headerStackView)
        
        self.view.addSubview(questionStackView)
        self.questionView.addSubview(questionTextField)
        self.questionStackView.addArrangedSubview(questionLabel)
        self.questionStackView.addArrangedSubview(questionView)
        self.questionStackView.addArrangedSubview(questionWarningLabel)
        self.answerView.addSubview(answerTextField)
        self.questionStackView.addArrangedSubview(answerLabel)
        self.questionStackView.addArrangedSubview(answerView)
        self.questionStackView.addArrangedSubview(characterLimitLabel)
        
        self.view.addSubview(registerAccountButton)
        self.view.addSubview(signInStackView)
        self.signInStackView.addArrangedSubview(signInLabel)
        self.signInStackView.addArrangedSubview(signInButton)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupHeaderStackViewConstraints()
        setupPageOneButtonConstraints()
        setupQuestionStackViewConstraints()
        setupQuestionViewConstraints()
        setupQuestionTextFieldConstraints()
        setupAnswerViewConstraints()
        setupAnswerTextFieldConstraints()
        setupRegisterAccountButtonConstraints()
        setupSignInStackViewConstraints()
        
        self.questionStackView.setCustomSpacing(8, after: self.questionLabel)
        self.questionStackView.setCustomSpacing(20, after: self.questionWarningLabel)
        self.questionStackView.setCustomSpacing(8, after: self.answerLabel)
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
    func setupQuestionStackViewConstraints() {
        NSLayoutConstraint.activate([
            questionStackView.topAnchor.constraint(equalTo: self.headerStackView.bottomAnchor, constant: 24),
            questionStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24),
            questionStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -24)
        ])
    }
    
    func setupQuestionViewConstraints() {
        questionView.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func setupQuestionTextFieldConstraints() {
        questionTextField.rightAnchor.constraint(equalTo: self.questionView.rightAnchor, constant: -12).isActive = true
        questionTextField.leftAnchor.constraint(equalTo: self.questionView.leftAnchor, constant: 12).isActive = true
        questionTextField.topAnchor.constraint(equalTo: self.questionView.topAnchor, constant: 5).isActive = true
        questionTextField.bottomAnchor.constraint(equalTo: self.questionView.bottomAnchor, constant: -5).isActive = true
    }
    
    func setupAnswerViewConstraints() {
        answerView.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func setupAnswerTextFieldConstraints() {
        answerTextField.rightAnchor.constraint(equalTo: self.answerView.rightAnchor, constant: -12).isActive = true
        answerTextField.leftAnchor.constraint(equalTo: self.answerView.leftAnchor, constant: 12).isActive = true
        answerTextField.topAnchor.constraint(equalTo: self.answerView.topAnchor, constant: 5).isActive = true
        answerTextField.bottomAnchor.constraint(equalTo: self.answerView.bottomAnchor, constant: -5).isActive = true
    }
    
    // Footer
    func setupRegisterAccountButtonConstraints() {
        NSLayoutConstraint.activate([
            registerAccountButton.bottomAnchor.constraint(equalTo: self.signInStackView.topAnchor, constant: -68),
            registerAccountButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    func setupSignInStackViewConstraints() {
        NSLayoutConstraint.activate([
            signInStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            signInStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
}
