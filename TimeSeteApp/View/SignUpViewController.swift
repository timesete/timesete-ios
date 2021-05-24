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
    private(set) lazy var headerStackView: UIStackView = {
        let headerStackView = UIStackView()
        headerStackView.axis = .vertical
        headerStackView.distribution = .fillEqually
        headerStackView.spacing = 16
        headerStackView.backgroundColor = .clear
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        return headerStackView
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Insira suas informações de acesso"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .appBlack
        titleLabel.font = UIFont(name: .nunitoBold, size: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private(set) lazy var pageImage: UIImageView = {
        let pageImage = UIImageView()
        pageImage.image = .pageOne
        pageImage.contentMode = .scaleAspectFit
        pageImage.translatesAutoresizingMaskIntoConstraints = false
        return pageImage
    }()
    
    // Main
    private(set) lazy var signUpStackView: UIStackView = {
        let signUpStackView = UIStackView()
        signUpStackView.axis = .vertical
        signUpStackView.distribution = .fill
        signUpStackView.spacing = 4
        signUpStackView.backgroundColor = .clear
        signUpStackView.translatesAutoresizingMaskIntoConstraints = false
        return signUpStackView
    }()
    
    private(set) lazy var emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = "E-mail"
        emailLabel.textAlignment = .left
        emailLabel.textColor = .appBlack
        emailLabel.font = UIFont(name: .nunitoRegular, size: 16)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailLabel
    }()
    
    private(set) lazy var emailView: UIView = {
        let emailView = UIView()
        emailView.backgroundColor = .white
        emailView.layer.cornerRadius = 4
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = UIColor.appGray03.cgColor
        emailView.translatesAutoresizingMaskIntoConstraints = false
        return emailView
    }()
    
    private(set) lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "Insira seu e-mail"
        emailTextField.font = UIFont(name: .nunitoRegular, size: 16)
        emailTextField.borderStyle = .none
        emailTextField.backgroundColor = .clear
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.tintColor = .appPurple
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        return emailTextField
    }()
    
    private(set) lazy var emailErrorImage: UIImageView = {
        let emailErrorImage = UIImageView()
        emailErrorImage.image = .errorIcon
        emailErrorImage.contentMode = .scaleAspectFit
        emailErrorImage.isHidden = true
        emailErrorImage.translatesAutoresizingMaskIntoConstraints = false
        return emailErrorImage
    }()
    
    private(set) lazy var emailWarningLabel: UILabel = {
        let emailWarningLabel = UILabel()
        emailWarningLabel.text = "E-mail incorreto"
        emailWarningLabel.textAlignment = .left
        emailWarningLabel.textColor = .clear
        emailWarningLabel.font = UIFont(name: .nunitoRegular, size: 12)
        emailWarningLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailWarningLabel
    }()
    
    private(set) lazy var passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.text = "Senha"
        passwordLabel.textAlignment = .left
        passwordLabel.textColor = .appBlack
        passwordLabel.font = UIFont(name: .nunitoRegular, size: 16)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordLabel
    }()
    
    private(set) lazy var passwordView: UIView = {
        let passwordView = UIView()
        passwordView.backgroundColor = .white
        passwordView.layer.cornerRadius = 4
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor.appGray03.cgColor
        passwordView.translatesAutoresizingMaskIntoConstraints = false
        return passwordView
    }()
    
    private(set) lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Insira sua senha"
        passwordTextField.font = UIFont(name: .nunitoRegular, size: 16)
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
    
    private(set) lazy var passwordErrorImage: UIImageView = {
        let passwordErrorImage = UIImageView()
        passwordErrorImage.image = .errorIcon
        passwordErrorImage.contentMode = .scaleAspectFit
        passwordErrorImage.isHidden = true
        passwordErrorImage.translatesAutoresizingMaskIntoConstraints = false
        return passwordErrorImage
    }()
    
    private(set) lazy var passwordWarningLabel: UILabel = {
        let passwordWarningLabel = UILabel()
        passwordWarningLabel.text = "Senha inválida"
        passwordWarningLabel.textAlignment = .left
        passwordWarningLabel.textColor = .clear
        passwordWarningLabel.font = UIFont(name: .nunitoRegular, size: 12)
        passwordWarningLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordWarningLabel
    }()
    
    private(set) lazy var showPasswordButton: UIButton = {
        let showPasswordButton = UIButton()
        showPasswordButton.backgroundColor = .clear
        showPasswordButton.setTitle(.none, for: .normal)
        showPasswordButton.setBackgroundImage(.hidePassword, for: .normal)
        showPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        showPasswordButton.addTarget(self, action: #selector(showPasswordAction), for: .touchUpInside)
        return showPasswordButton
    }()
    
    private(set) lazy var confirmPasswordLabel: UILabel = {
        let confirmPasswordLabel = UILabel()
        confirmPasswordLabel.text = "Confirme sua senha"
        confirmPasswordLabel.textAlignment = .left
        confirmPasswordLabel.textColor = .appBlack
        confirmPasswordLabel.font = UIFont(name: .nunitoRegular, size: 16)
        confirmPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        return confirmPasswordLabel
    }()
    
    private(set) lazy var confirmPasswordView: UIView = {
        let confirmPasswordView = UIView()
        confirmPasswordView.backgroundColor = .white
        confirmPasswordView.layer.cornerRadius = 4
        confirmPasswordView.layer.borderWidth = 1
        confirmPasswordView.layer.borderColor = UIColor.appGray03.cgColor
        confirmPasswordView.translatesAutoresizingMaskIntoConstraints = false
        return confirmPasswordView
    }()
    
    private(set) lazy var confirmPasswordTextField: UITextField = {
        let confirmPasswordTextField = UITextField()
        confirmPasswordTextField.placeholder = "Insira sua senha"
        confirmPasswordTextField.font = UIFont(name: .nunitoRegular, size: 16)
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
    
    private(set) lazy var confirmPasswordWarningLabel: UILabel = {
        let confirmPasswordWarningLabel = UILabel()
        confirmPasswordWarningLabel.text = "Senha excelente!"
        confirmPasswordWarningLabel.textAlignment = .left
        confirmPasswordWarningLabel.textColor = .clear
        confirmPasswordWarningLabel.font = UIFont(name: .nunitoRegular, size: 12)
        confirmPasswordWarningLabel.translatesAutoresizingMaskIntoConstraints = false
        return confirmPasswordWarningLabel
    }()
    
    private(set) lazy var showConfirmPasswordButton: UIButton = {
        let showConfirmPasswordButton = UIButton()
        showConfirmPasswordButton.backgroundColor = .clear
        showConfirmPasswordButton.setTitle(.none, for: .normal)
        showConfirmPasswordButton.setBackgroundImage(.hidePassword, for: .normal)
        showConfirmPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        showConfirmPasswordButton.addTarget(self, action: #selector(showConfirmPasswordAction), for: .touchUpInside)
        return showConfirmPasswordButton
    }()
    
    // Footer
    private(set) lazy var proceedButton: UIButton = {
        let proceedButton = UIButton()
        proceedButton.setBackgroundImage(.cyanButton, for: .normal)
        proceedButton.setBackgroundImage(.cyanDarkButton, for: .highlighted)
        proceedButton.setTitle("Avançar", for: .normal)
        proceedButton.setTitleColor(.white, for: .normal)
        proceedButton.titleLabel?.font = UIFont(name: .nunitoBlack, size: 18)
        proceedButton.translatesAutoresizingMaskIntoConstraints = false
        proceedButton.addTarget(self, action: #selector(proceedAction), for: .touchUpInside)
        return proceedButton
    }()
    
    private(set) lazy var signInStackView: UIStackView = {
        let signInStackView = UIStackView()
        signInStackView.axis = .horizontal
        signInStackView.distribution = .equalCentering
        signInStackView.spacing = 3
        signInStackView.backgroundColor = .clear
        signInStackView.translatesAutoresizingMaskIntoConstraints = false
        return signInStackView
    }()
    
    private(set) lazy var signInLabel: UILabel = {
        let signInLabel = UILabel()
        signInLabel.text = "Já tem uma conta?"
        signInLabel.textAlignment = .center
        signInLabel.textColor = .appGray01
        signInLabel.font = UIFont(name: .nunitoRegular, size: 14)
        signInLabel.translatesAutoresizingMaskIntoConstraints = false
        return signInLabel
    }()
    
    private(set) lazy var signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.backgroundColor = .clear
        signInButton.setTitle("Entre aqui", for: .normal)
        signInButton.setTitleColor(.appGray01, for: .normal)
        signInButton.setTitleColor(.appGray03, for: .highlighted)
        signInButton.titleLabel?.font = UIFont(name: .nunitoBold, size: 14)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        return signInButton
    }()
    
    // MARK: Actions
    @objc func showPasswordAction(sender: UIButton) {
        switch sender.currentBackgroundImage {
        case UIImage.hidePassword:
            sender.setBackgroundImage(.showPassword, for: .normal)
            passwordTextField.isSecureTextEntry = false
        default:
            sender.setBackgroundImage(.hidePassword, for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    @objc func showConfirmPasswordAction(sender: UIButton) {
        switch sender.currentBackgroundImage {
        case UIImage.hidePassword:
            sender.setBackgroundImage(.showPassword, for: .normal)
            confirmPasswordTextField.isSecureTextEntry = false
        default:
            sender.setBackgroundImage(.hidePassword, for: .normal)
            confirmPasswordTextField.isSecureTextEntry = true
        }
    }
    
    @objc func proceedAction(sender: UIButton) {
        guard let emailText = emailTextField.text else { return }
        guard let passwordText = passwordTextField.text else { return }
        guard let confirmPasswordText = confirmPasswordTextField.text else { return }
        
        if emailText.isValidEmail,
           passwordText.count >= 8,
           passwordText == confirmPasswordText {
            presenter.goToSecondSignUp()
        }
        if !emailText.isValidEmail {
            emailTextField.invalidField(titleLabel: emailLabel, errorImage: emailErrorImage, warningLabel: emailWarningLabel)
        }
        if passwordText.count < 8 {
            passwordTextField.invalidField(titleLabel: passwordLabel,
                                           errorImage: passwordErrorImage,
                                           warningLabel: passwordWarningLabel,
                                           showPasswordButton: showPasswordButton)
            confirmPasswordTextField.invalidField(titleLabel: confirmPasswordLabel)
        }
    }
    
    @objc func signInAction(sender: UIButton) {
        presenter.backToLogin()
    }
}

// MARK: Text Field
extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case emailTextField:
            textField.setBorderColorIfNeeded(titleLabel: emailLabel, errorImage: emailErrorImage, warningLabel: emailWarningLabel)
        case passwordTextField:
            textField.setBorderColorIfNeeded(titleLabel: passwordLabel, errorImage: passwordErrorImage, warningLabel: passwordWarningLabel)
        default:
            textField.setBorderColorIfNeeded(titleLabel: confirmPasswordLabel)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case emailTextField:
            textField.setBorderColorIfNeeded(titleLabel: emailLabel, errorImage: emailErrorImage, warningLabel: emailWarningLabel)
        case passwordTextField:
            textField.setBorderColorIfNeeded(titleLabel: passwordLabel,
                                             errorImage: passwordErrorImage,
                                             warningLabel: passwordWarningLabel,
                                             showPasswordButton: showPasswordButton)
        default:
            textField.setBorderColorIfNeeded(titleLabel: confirmPasswordLabel)
        }
    }
}
