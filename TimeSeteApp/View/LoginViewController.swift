//
//  ViewController.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 18/05/21.
//

import UIKit

class LoginViewController: UIViewController, LoginPresenterDelegate {
     
    private let presenter = LoginPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        presenter.setViewDelegate(delegate: self)
        presenter.getLogin()
        self.view.setBackgroundColor(to: .appGray04)
        
        addSubviews()
        setupConstraints()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        self.navigationController?.isNavigationBarHidden = true

        let coreDataManager = CoreDataManager.shared
        let users = coreDataManager.fetchUsers()

        guard let users = users else { return }
        coreDataManager.logoutAll(users)

        for user in users {
            print("\(String(describing: user.name)) = \(user.isLogged)")
        }
    }

//    func presentLogin(credentials: Login) {
//        print("presentLogin")
//    }
    
    // Header
    private(set) lazy var logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = .logoLogin
        logoImage.contentMode = .scaleAspectFit
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    }()
   
    // Main
    private(set) lazy var loginStackView: UIStackView = {
        let loginStackView = UIStackView()
        loginStackView.axis = .vertical
        loginStackView.distribution = .fill
        loginStackView.spacing = 4
        loginStackView.backgroundColor = .clear
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        return loginStackView
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
    
    private(set) lazy var forgotPasswordButton: UIButton = {
        let forgotPasswordButton = UIButton()
        forgotPasswordButton.setTitle("Esqueceu sua senha?", for: .normal)
        forgotPasswordButton.contentHorizontalAlignment = .right
        forgotPasswordButton.setTitleColor(.appGray01, for: .normal)
        forgotPasswordButton.setTitleColor(.gray, for: .highlighted)
        forgotPasswordButton.titleLabel?.font = UIFont(name: .nunitoBold, size: 14)
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordAction), for: .touchUpInside)
        return forgotPasswordButton
    }()
    
    // Footer
    private(set) lazy var signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.setBackgroundImage(.purpleButton, for: .normal)
        signInButton.setBackgroundImage(.purpleDarkButton, for: .highlighted)
        signInButton.setTitle("Entrar na conta", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.titleLabel?.font = UIFont(name: .nunitoBlack, size: 18)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        return signInButton
    }()
    
    private(set) lazy var skipButton: UIButton = {
        let skipButton = UIButton()
        skipButton.setBackgroundImage(.skipButton, for: .normal)
        skipButton.setBackgroundImage(.skipDarkButton, for: .highlighted)
        skipButton.setTitle(.none, for: .normal)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.addTarget(self, action: #selector(skipAction), for: .touchUpInside)
        return skipButton
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
    
    private(set) lazy var signUpLabel: UILabel = {
        let signUpLabel = UILabel()
        signUpLabel.text = "Ainda não tem uma conta?"
        signUpLabel.textAlignment = .center
        signUpLabel.textColor = .appGray01
        signUpLabel.font = UIFont(name: .nunitoRegular, size: 14)
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        return signUpLabel
    }()
    
    private(set) lazy var signUpButton: UIButton = {
        let signUpButton = UIButton()
        signUpButton.backgroundColor = .clear
        signUpButton.setTitle("Cadastre-se aqui", for: .normal)
        signUpButton.setTitleColor(.appGray01, for: .normal)
        signUpButton.setTitleColor(.appGray03, for: .highlighted)
        signUpButton.titleLabel?.font = UIFont(name: .nunitoBold, size: 14)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        return signUpButton
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
    
    @objc func forgotPasswordAction(sender: UIButton) {
        presenter.goToForgotPassword()
    }
    
    @objc func signInAction(sender: UIButton) {
        guard let emailText = emailTextField.text else { return }
        guard let passwordText = passwordTextField.text else { return }

        let coreDataManager = CoreDataManager.shared
        let user = coreDataManager.fetchUser(with: emailText)

        if emailText.isValidEmail,
           passwordText.count >= 8,
           user?.email == emailText,
           user?.password == passwordText {
            coreDataManager.login(user)
            presenter.goToHome()
        }

        if !emailText.isValidEmail || user?.email != emailText {
            emailTextField.invalidField(titleLabel: emailLabel, errorImage: emailErrorImage, warningLabel: emailWarningLabel)
        }

        if passwordText.count < 8 || user?.password != passwordText {
            passwordTextField.invalidField(titleLabel: passwordLabel,
                                           errorImage: passwordErrorImage,
                                           warningLabel: passwordWarningLabel,
                                           showPasswordButton: showPasswordButton)
        }
    }
    
    @objc func skipAction(sender: UIButton) {
        presenter.goToCreateFriend()
    }
    
    @objc func signUpAction(sender: UIButton) {
        presenter.goToSignUp()
    }
    
}

// MARK: Text Field
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        switch textField {
        case emailTextField:
            textField.setBorderColorIfNeeded(titleLabel: emailLabel, errorImage: emailErrorImage, warningLabel: emailWarningLabel)
        default:
            textField.setBorderColorIfNeeded(titleLabel: passwordLabel, errorImage: passwordErrorImage, warningLabel: passwordWarningLabel)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
        case emailTextField:
            textField.setBorderColorIfNeeded(titleLabel: emailLabel, errorImage: emailErrorImage, warningLabel: emailWarningLabel)
        default:
            textField.setBorderColorIfNeeded(titleLabel: passwordLabel,
                                             errorImage: passwordErrorImage,
                                             warningLabel: passwordWarningLabel,
                                             showPasswordButton: showPasswordButton)
        }
    }
}
