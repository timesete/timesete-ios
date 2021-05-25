//
//  SecondRecoverPasswordViewController.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 24/05/21.
//

import UIKit

class SecondRecoverPasswordViewController: UIViewController, SecondRecoverPasswordPresenterDelegate {

    let presenter = SecondRecoverPasswordPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setBackgroundColor(to: .appGray04)
        presenter.setViewDelegate(delegate: self)
        addSubviews()
    }
    
    override func loadView() {
        self.view = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupConstraints()
        self.answerTextField.delegate = self
        self.passwordTextField.delegate = self
        self.confirmPasswordTextField.delegate = self
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
        titleLabel.text = "Insira sua resposta secreta e a nova senha"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .appBlack
        titleLabel.font = UIFont(name: .nunitoBold, size: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private(set) lazy var pageImage: UIImageView = {
        let pageImage = UIImageView()
        pageImage.image = .pageTwo
        pageImage.contentMode = .scaleAspectFit
        pageImage.translatesAutoresizingMaskIntoConstraints = false
        return pageImage
    }()
    
    private(set) lazy var pageOneButton: UIButton = {
        let pageOneButton = UIButton()
        pageOneButton.backgroundColor = .clear
        pageOneButton.setTitle(.none, for: .normal)
        pageOneButton.translatesAutoresizingMaskIntoConstraints = false
        pageOneButton.addTarget(self, action: #selector(pageOneAction), for: .touchUpInside)
        return pageOneButton
    }()
    
    // Main
    private(set) lazy var newPasswordStackView: UIStackView = {
        let newPasswordStackView = UIStackView()
        newPasswordStackView.axis = .vertical
        newPasswordStackView.distribution = .fill
        newPasswordStackView.spacing = 4
        newPasswordStackView.backgroundColor = .clear
        newPasswordStackView.translatesAutoresizingMaskIntoConstraints = false
        return newPasswordStackView
    }()
    
    private(set) lazy var questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.text = data[0]
        questionLabel.textAlignment = .left
        questionLabel.textColor = .appBlack
        questionLabel.font = UIFont(name: .nunitoRegular, size: 16)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        return questionLabel
    }()
    
    private(set) lazy var answerView: UIView = {
        let answerView = UIView()
        answerView.backgroundColor = .white
        answerView.layer.cornerRadius = 4
        answerView.layer.borderWidth = 1
        answerView.layer.borderColor = UIColor.appGray03.cgColor
        answerView.translatesAutoresizingMaskIntoConstraints = false
        return answerView
    }()
    
    private(set) lazy var answerTextField: UITextField = {
        let answerTextField = UITextField()
        answerTextField.placeholder = "Insira sua resposta"
        answerTextField.font = UIFont(name: .nunitoRegular, size: 16)
        answerTextField.borderStyle = .none
        answerTextField.backgroundColor = .clear
        answerTextField.keyboardType = .emailAddress
        answerTextField.autocapitalizationType = .none
        answerTextField.autocorrectionType = .no
        answerTextField.tintColor = .appPurple
        answerTextField.translatesAutoresizingMaskIntoConstraints = false
        return answerTextField
    }()
    
    private(set) lazy var answerErrorImage: UIImageView = {
        let answerErrorImage = UIImageView()
        answerErrorImage.image = .errorIcon
        answerErrorImage.contentMode = .scaleAspectFit
        answerErrorImage.isHidden = true
        answerErrorImage.translatesAutoresizingMaskIntoConstraints = false
        return answerErrorImage
    }()
    
    private(set) lazy var answerWarningLabel: UILabel = {
        let answerWarningLabel = UILabel()
        answerWarningLabel.text = "Resposta incorreta"
        answerWarningLabel.textAlignment = .left
        answerWarningLabel.textColor = .clear
        answerWarningLabel.font = UIFont(name: .nunitoRegular, size: 12)
        answerWarningLabel.translatesAutoresizingMaskIntoConstraints = false
        return answerWarningLabel
    }()
    
    private(set) lazy var passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.text = "Sua nova senha"
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
        passwordTextField.placeholder = "Insira sua nova senha"
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
        confirmPasswordLabel.text = "Confirme sua nova senha"
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
        confirmPasswordTextField.placeholder = "Insira sua nova senha"
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
        confirmPasswordWarningLabel.text = "Senha inválida"
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
    private(set) lazy var recoverPasswordButton: UIButton = {
        let recoverPasswordButton = UIButton()
        recoverPasswordButton.setBackgroundImage(.cyanButton, for: .normal)
        recoverPasswordButton.setBackgroundImage(.cyanDarkButton, for: .highlighted)
        recoverPasswordButton.setTitle("Redefinir senha", for: .normal)
        recoverPasswordButton.setTitleColor(.white, for: .normal)
        recoverPasswordButton.titleLabel?.font = UIFont(name: .nunitoBlack, size: 18)
        recoverPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        recoverPasswordButton.addTarget(self, action: #selector(recoverPasswordAction), for: .touchUpInside)
        return recoverPasswordButton
    }()
    
    private(set) lazy var cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.setBackgroundImage(.cancelButton, for: .normal)
        cancelButton.setBackgroundImage(.cancelDarkButton, for: .highlighted)
        cancelButton.setTitle(.none, for: .normal)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        return cancelButton
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
    
    @objc func recoverPasswordAction(sender: UIButton) {
        guard let answerText = answerTextField.text else { return }
        guard let passwordText = passwordTextField.text else { return }
        guard let confirmPasswordText = confirmPasswordTextField.text else { return }
        
        if answerText.count > 0,
           passwordText.count >= 8,
           passwordText == confirmPasswordText {
            // mostrar alerta
//            presenter.backToLogin()
        }
        if answerText.count == 0 {
            answerTextField.invalidField(titleLabel: questionLabel, errorImage: answerErrorImage, warningLabel: answerWarningLabel)
        }
        if passwordText.count < 8 {
            passwordTextField.invalidField(titleLabel: passwordLabel,
                                           errorImage: passwordErrorImage,
                                           warningLabel: passwordWarningLabel,
                                           showPasswordButton: showPasswordButton)
            confirmPasswordTextField.invalidField(titleLabel: confirmPasswordLabel)
        }
    }
    
    @objc func cancelAction(sender: UIButton) {
        presenter.backToLogin()
    }
   
    @objc func pageOneAction(sender: UIButton) {
        presenter.backToRecoverPassword()
    }
}

// MARK: Text Field
extension SecondRecoverPasswordViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case answerTextField:
            textField.setBorderColorIfNeeded(titleLabel: questionLabel, errorImage: answerErrorImage, warningLabel: answerWarningLabel)
        case passwordTextField:
            textField.setBorderColorIfNeeded(titleLabel: passwordLabel, errorImage: passwordErrorImage, warningLabel: passwordWarningLabel)
        default:
            textField.setBorderColorIfNeeded(titleLabel: confirmPasswordLabel)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case answerTextField:
            textField.setBorderColorIfNeeded(titleLabel: questionLabel, errorImage: answerErrorImage, warningLabel: answerWarningLabel)
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
