//
//  SignUpViewController.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 20/05/21.
//

import UIKit

class SignUpViewController: UIViewController, SignUpPresenterDelegate {
    
    private let presenter = SignUpPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setBackgroundColor(to: .appGray04)
        presenter.setViewDelegate(delegate: self)
        addSubviews()
        setupConstraints()
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.confirmPasswordTextField.delegate = self
    }

    override func loadView() {
        self.view = UIView()
    }
    
    func presentSignUp(credentials: Login) {
        print("Presenter")
    }
    
    // MARK: Define elements
    private lazy var headerStackView: UIStackView = {
        let headerStackView = UIStackView()
        headerStackView.axis = .vertical
        headerStackView.distribution = .fillEqually
        headerStackView.spacing = 16
        headerStackView.backgroundColor = .clear
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        return headerStackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Insira suas informações de acesso"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .appBlack
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var pageImage: UIImageView = {
        let pageImage = UIImageView()
        pageImage.image = .pageOne
        pageImage.contentMode = .scaleAspectFit
        pageImage.translatesAutoresizingMaskIntoConstraints = false
        return pageImage
    }()
    
    // Main
    private lazy var signUpStackView: UIStackView = {
        let signUpStackView = UIStackView()
        signUpStackView.axis = .vertical
        signUpStackView.distribution = .fill
        signUpStackView.spacing = 4
        signUpStackView.backgroundColor = .clear
        signUpStackView.translatesAutoresizingMaskIntoConstraints = false
        return signUpStackView
    }()
    
    private lazy var emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = "E-mail"
        emailLabel.textAlignment = .left
        emailLabel.textColor = .appBlack
        emailLabel.font = UIFont.systemFont(ofSize: 16)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailLabel
    }()
    
    private lazy var emailView: UIView = {
        let emailView = UIView()
        emailView.backgroundColor = .white
        emailView.layer.cornerRadius = 4
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = UIColor.appGray03.cgColor
        emailView.translatesAutoresizingMaskIntoConstraints = false
        return emailView
    }()
    
    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "Insira seu e-mail"
        emailTextField.borderStyle = .none
        emailTextField.backgroundColor = .clear
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.tintColor = .appPurple
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        return emailTextField
    }()
    
    private lazy var emailWarningLabel: UILabel = {
        let emailWarningLabel = UILabel()
        emailWarningLabel.text = "E-mail incorreto"
        emailWarningLabel.textAlignment = .left
        emailWarningLabel.textColor = .clear
        emailWarningLabel.font = UIFont.systemFont(ofSize: 12)
        emailWarningLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailWarningLabel
    }()
    
    private lazy var passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.text = "Senha"
        passwordLabel.textAlignment = .left
        passwordLabel.textColor = .appBlack
        passwordLabel.font = UIFont.systemFont(ofSize: 16)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordLabel
    }()
    
    private lazy var passwordView: UIView = {
        let passwordView = UIView()
        passwordView.backgroundColor = .white
        passwordView.layer.cornerRadius = 4
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor.appGray03.cgColor
        passwordView.translatesAutoresizingMaskIntoConstraints = false
        return passwordView
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Insira sua senha"
        passwordTextField.borderStyle = .none
        passwordTextField.backgroundColor = .clear
        passwordTextField.isSecureTextEntry = true
        passwordTextField.keyboardType = .default
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.tintColor = .appPurple
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    
    private lazy var passwordWarningLabel: UILabel = {
        let passwordWarningLabel = UILabel()
        passwordWarningLabel.text = "Senha excelente!"
        passwordWarningLabel.textAlignment = .left
        passwordWarningLabel.textColor = .clear
        passwordWarningLabel.font = UIFont.systemFont(ofSize: 12)
        passwordWarningLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordWarningLabel
    }()
    
    private lazy var confirmPasswordLabel: UILabel = {
        let confirmPasswordLabel = UILabel()
        confirmPasswordLabel.text = "Confirme sua senha"
        confirmPasswordLabel.textAlignment = .left
        confirmPasswordLabel.textColor = .appBlack
        confirmPasswordLabel.font = UIFont.systemFont(ofSize: 16)
        confirmPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        return confirmPasswordLabel
    }()
    
    private lazy var confirmPasswordView: UIView = {
        let confirmPasswordView = UIView()
        confirmPasswordView.backgroundColor = .white
        confirmPasswordView.layer.cornerRadius = 4
        confirmPasswordView.layer.borderWidth = 1
        confirmPasswordView.layer.borderColor = UIColor.appGray03.cgColor
        confirmPasswordView.translatesAutoresizingMaskIntoConstraints = false
        return confirmPasswordView
    }()
    
    private lazy var confirmPasswordTextField: UITextField = {
        let confirmPasswordTextField = UITextField()
        confirmPasswordTextField.placeholder = "Insira sua senha"
        confirmPasswordTextField.borderStyle = .none
        confirmPasswordTextField.backgroundColor = .clear
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.keyboardType = .default
        confirmPasswordTextField.autocapitalizationType = .none
        confirmPasswordTextField.autocorrectionType = .no
        confirmPasswordTextField.tintColor = .appPurple
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        return confirmPasswordTextField
    }()
    
    private lazy var confirmPasswordWarningLabel: UILabel = {
        let confirmPasswordWarningLabel = UILabel()
        confirmPasswordWarningLabel.text = "Senha excelente!"
        confirmPasswordWarningLabel.textAlignment = .left
        confirmPasswordWarningLabel.textColor = .clear
        confirmPasswordWarningLabel.font = UIFont.systemFont(ofSize: 12)
        confirmPasswordWarningLabel.translatesAutoresizingMaskIntoConstraints = false
        return confirmPasswordWarningLabel
    }()
    
    // Footer
    private lazy var proceedButton: UIButton = {
        let proceedButton = UIButton()
        proceedButton.setBackgroundImage(.cyanButton, for: .normal)
        proceedButton.setTitle("Avançar", for: .normal)
        proceedButton.setTitleColor(.white, for: .normal)
        proceedButton.setTitleColor(.gray, for: .highlighted)
        proceedButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        proceedButton.translatesAutoresizingMaskIntoConstraints = false
        proceedButton.addTarget(self, action: #selector(proceedAction), for: .touchUpInside)
        return proceedButton
    }()
    
    private lazy var signInStackView: UIStackView = {
        let signInStackView = UIStackView()
        signInStackView.axis = .horizontal
        signInStackView.distribution = .equalCentering
        signInStackView.spacing = 3
        signInStackView.backgroundColor = .clear
        signInStackView.translatesAutoresizingMaskIntoConstraints = false
        return signInStackView
    }()
    
    private lazy var signInLabel: UILabel = {
        let signInLabel = UILabel()
        signInLabel.text = "Já tem uma conta?"
        signInLabel.textAlignment = .center
        signInLabel.textColor = .appGray01
        signInLabel.font = UIFont.systemFont(ofSize: 14)
        signInLabel.translatesAutoresizingMaskIntoConstraints = false
        return signInLabel
    }()
    
    private lazy var signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.backgroundColor = .clear
        signInButton.setTitle("Entre aqui", for: .normal)
        signInButton.setTitleColor(.appGray01, for: .normal)
        signInButton.setTitleColor(.appGray03, for: .highlighted)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        return signInButton
    }()
    
    // MARK: Actions
    @objc func signInAction(sender: UIButton) {
        presenter.backToLogin()
    }
    
    @objc func proceedAction(sender: UIButton) {
        presenter.goToSecondSignUp()
    }
}

extension SignUpViewController {
    
    // MARK: Subviews
    func addSubviews() {
        self.view.addSubview(headerStackView)
        self.headerStackView.addArrangedSubview(titleLabel)
        self.headerStackView.addArrangedSubview(pageImage)
        
        self.view.addSubview(signUpStackView)
        self.emailView.addSubview(emailTextField)
        self.signUpStackView.addArrangedSubview(emailLabel)
        self.signUpStackView.addArrangedSubview(emailView)
        self.signUpStackView.addArrangedSubview(emailWarningLabel)
        self.passwordView.addSubview(passwordTextField)
        self.signUpStackView.addArrangedSubview(passwordLabel)
        self.signUpStackView.addArrangedSubview(passwordView)
        self.signUpStackView.addArrangedSubview(passwordWarningLabel)
        self.confirmPasswordView.addSubview(confirmPasswordTextField)
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
        setupEmailTextFieldConstraints()
        setupPasswordViewConstraints()
        setupPasswordTextFieldConstraints()
        setupConfirmPasswordViewConstraints()
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
    
    func setupEmailTextFieldConstraints() {
        emailTextField.rightAnchor.constraint(equalTo: self.emailView.rightAnchor, constant: -12).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: self.emailView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: self.emailView.topAnchor, constant: 5).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: self.emailView.bottomAnchor, constant: -5).isActive = true
    }
    
    func setupPasswordViewConstraints() {
        passwordView.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func setupPasswordTextFieldConstraints() {
        passwordTextField.rightAnchor.constraint(equalTo: self.passwordView.rightAnchor, constant: -12).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: self.passwordView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: self.passwordView.topAnchor, constant: 5).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: self.passwordView.bottomAnchor, constant: -5).isActive = true
    }
    
    func setupConfirmPasswordViewConstraints() {
        confirmPasswordView.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func setupConfirmPasswordTextFieldConstraints() {
        confirmPasswordTextField.rightAnchor.constraint(equalTo: self.confirmPasswordView.rightAnchor, constant: -12).isActive = true
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

// MARK: Text Field
extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.setBorderColorIfNeeded(view: textField.superview)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.setBorderColorIfNeeded(view: textField.superview)
    }
}
