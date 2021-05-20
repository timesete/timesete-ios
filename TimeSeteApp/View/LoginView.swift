//
//  LoginView.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 19/05/21.
//

import UIKit

protocol LoginViewProtocol: class {
    func signUpButtonTapped() 
}

class LoginView: UIView {
    
    weak var delegate: LoginViewProtocol?
    
    // Header
    private lazy var logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = .logoLogin
        logoImage.contentMode = .scaleAspectFit
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    }()
    
    // Sign in
    private lazy var loginStackView: UIStackView = {
        let loginStackView = UIStackView()
        loginStackView.axis = .vertical
        loginStackView.distribution = .fillEqually
        loginStackView.spacing = 16
        loginStackView.backgroundColor = .clear
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        return loginStackView
    }()

    private lazy var emailStackView: UIStackView = {
        let emailStackView = UIStackView()
        emailStackView.axis = .vertical
        emailStackView.spacing = 5
        emailStackView.backgroundColor = .clear
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        return emailStackView
    }()
    
    private lazy var passwordStackView: UIStackView = {
        let passwordStackView = UIStackView()
        passwordStackView.axis = .vertical
        passwordStackView.spacing = 5
        passwordStackView.backgroundColor = .clear
        passwordStackView.translatesAutoresizingMaskIntoConstraints = false
        return passwordStackView
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
    
    // sem constraint ainda
    private lazy var emailWarningLabel: UILabel = {
        let emailWarningLabel = UILabel()
        emailWarningLabel.text = "E-mail incorreto"
        emailWarningLabel.textAlignment = .left
        emailWarningLabel.textColor = .appRed
        emailWarningLabel.font = UIFont.systemFont(ofSize: 13)
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
    
    // sem constraint ainda
    private lazy var passwordWarningLabel: UILabel = {
        let passwordWarningLabel = UILabel()
        passwordWarningLabel.text = "Senha incorreta"
        passwordWarningLabel.textAlignment = .left
        passwordWarningLabel.textColor = .appRed
        passwordWarningLabel.font = UIFont.systemFont(ofSize: 13)
        passwordWarningLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordWarningLabel
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
    
    private lazy var passwordView: UIView = {
        let passwordView = UIView()
        passwordView.backgroundColor = .white
        passwordView.layer.cornerRadius = 4
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor.appGray03.cgColor
        passwordView.translatesAutoresizingMaskIntoConstraints = false
        return passwordView
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
    
    private lazy var passwordTextField: UITextField = {
        
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Insira sua senha"
        passwordTextField.borderStyle = .none
        passwordTextField.backgroundColor = .clear
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
        passwordTextField.tintColor = .appPurple
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    
    private lazy var signInButton: UIButton = {

        let signInButton = UIButton()
        signInButton.backgroundColor = .appPurple
        signInButton.layer.cornerRadius = 8
        signInButton.setTitle("Entrar na conta", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.setTitleColor(.gray, for: .highlighted)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        return signInButton
    }()
    
    private lazy var signUpButton: UIButton = {

        let signUpButton = UIButton()
        signUpButton.backgroundColor = .clear
        signUpButton.setTitle("Cadastre-se", for: .normal)
        signUpButton.setTitleColor(.appGray01, for: .normal)
        signUpButton.setTitleColor(.appGray03, for: .highlighted)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        return signUpButton
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
    
        self.setBackgroundColor(to: .appGray04)
        
        addSubviews()
        setupConstraints()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    @objc func signInAction(sender: UIButton) {
        
    }
    
    @objc func signUpAction(sender: UIButton) {
        self.delegate?.signUpButtonTapped()
    }
}

extension LoginView {
    
    // MARK: Subviews
    func addSubviews() {
        self.addSubview(logoImage)
        
        self.addSubview(loginStackView)
        self.loginStackView.addArrangedSubview(emailStackView)
        self.loginStackView.addArrangedSubview(passwordStackView)
        self.emailStackView.addArrangedSubview(emailLabel)
        self.emailStackView.addArrangedSubview(emailView)
        self.emailView.addSubview(emailTextField)
        self.passwordStackView.addArrangedSubview(passwordLabel)
        self.passwordStackView.addArrangedSubview(passwordView)
        self.passwordView.addSubview(passwordTextField)
       
        self.addSubview(signInButton)
        self.addSubview(signUpButton)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupLogoImageConstraints()
        setupLoginStackViewConstraints()
        setupEmailViewConstraints()
        setupPasswordViewConstraints()
        setupEmailTextFieldConstraints()
        setupPasswordTextFieldConstraints()
        setupSignInButtonConstraints()
        setupSignUpButtonConstraints()
    }
    
    // Header
    func setupLogoImageConstraints() {
        logoImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        logoImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        logoImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
    }
    
    // Sign in
    func setupLoginStackViewConstraints() {
        loginStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        loginStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        loginStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func setupEmailViewConstraints() {
        emailView.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    func setupPasswordViewConstraints() {
        passwordView.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    func setupEmailTextFieldConstraints() {
        emailTextField.rightAnchor.constraint(equalTo: self.emailView.rightAnchor, constant: -12).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: self.emailView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: self.emailView.topAnchor, constant: 5).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: self.emailView.bottomAnchor, constant: -5).isActive = true
    }
    
    func setupPasswordTextFieldConstraints() {
        passwordTextField.rightAnchor.constraint(equalTo: self.passwordView.rightAnchor, constant: -12).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: self.passwordView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: self.passwordView.topAnchor, constant: 5).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: self.passwordView.bottomAnchor, constant: -5).isActive = true
    }
    
    func setupSignInButtonConstraints() {
        signInButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40).isActive = true
        signInButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40).isActive = true
        signInButton.topAnchor.constraint(equalTo: self.loginStackView.bottomAnchor, constant: 40).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    func setupSignUpButtonConstraints() {
        signUpButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40).isActive = true
        signUpButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
}

// MARK: TextField
extension LoginView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == emailTextField {
            emailView.layer.borderColor = UIColor.appPurple.cgColor
            passwordView.layer.borderColor = UIColor.appGray03.cgColor
            
        } else {
            emailView.layer.borderColor = UIColor.appGray03.cgColor
            passwordView.layer.borderColor = UIColor.appPurple.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == emailTextField {
            emailLabel.textColor = .appBlack
            
        } else {
            passwordLabel.textColor = .appBlack
        }
    }
}
