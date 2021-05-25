//
//  RecoverPasswordViewController.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 24/05/21.
//

import UIKit

class RecoverPasswordViewController: UIViewController, RecoverPasswordPresenterDelegate {

    let presenter = RecoverPasswordPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setViewDelegate(delegate: self)
        self.view.setBackgroundColor(to: .appGray04)
        addSubviews()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        self.view = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        emailTextField.delegate = self
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
        titleLabel.text = "Informe seu e-mail cadastrado"
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
    private(set) lazy var recoverPasswordStackView: UIStackView = {
        let recoverPasswordStackView = UIStackView()
        recoverPasswordStackView.axis = .vertical
        recoverPasswordStackView.distribution = .fill
        recoverPasswordStackView.spacing = 4
        recoverPasswordStackView.backgroundColor = .clear
        recoverPasswordStackView.translatesAutoresizingMaskIntoConstraints = false
        return recoverPasswordStackView
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
        emailWarningLabel.text = "E-mail não cadastrado."
        emailWarningLabel.textAlignment = .left
        emailWarningLabel.textColor = .clear
        emailWarningLabel.font = UIFont(name: .nunitoRegular, size: 12)
        emailWarningLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailWarningLabel
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
    @objc func proceedAction(sender: UIButton) {
        guard let emailText = emailTextField.text else { return }
        
        if !emailText.isValidEmail {
            emailTextField.invalidField(titleLabel: emailLabel, errorImage: emailErrorImage, warningLabel: emailWarningLabel)
        } else {
            presenter.goToSecondRecoverPassword()
        }
    }
    
    @objc func cancelAction(sender: UIButton) {
        presenter.backToLogin()
    }

}

// MARK: Text Field
extension RecoverPasswordViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.setBorderColorIfNeeded(titleLabel: emailLabel, errorImage: emailErrorImage, warningLabel: emailWarningLabel)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.setBorderColorIfNeeded(titleLabel: emailLabel, errorImage: emailErrorImage, warningLabel: emailWarningLabel)
    }
}
