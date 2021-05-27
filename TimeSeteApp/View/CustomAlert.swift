//
//  CustomAlert.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 25/05/21.
//

import UIKit

protocol AlertProtocol: class {
    func backToLogin(_: UIButton)
}

class CustomAlert: UIView {
    
    weak var delegate: AlertProtocol?
    
    private lazy var alertView: UIView = {
        let alertView = UIView()
        alertView.setBackgroundColor(to: .white)
        alertView.layer.cornerRadius = 8
        alertView.layer.borderWidth = 1
        alertView.layer.borderColor = UIColor.appGray04.cgColor
        alertView.translatesAutoresizingMaskIntoConstraints = false
        return alertView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .appBlack
        titleLabel.text = "Senha redefinida"
        titleLabel.font = UIFont(name: .nunitoBold, size: 20)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.textColor = .appBlack
        messageLabel.text = "Você alterou sua senha com sucesso."
        messageLabel.font = UIFont(name: .nunitoRegular, size: 16)
        messageLabel.layer.borderWidth = 1
        messageLabel.layer.borderColor = UIColor.appGray04.cgColor
        messageLabel.textAlignment = .center
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        return messageLabel
    }()
    
    private lazy var signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.setBackgroundImage(.sPurpleButton, for: .normal)
        signInButton.setBackgroundImage(.sPurpleDarkButton, for: .highlighted)
        signInButton.setTitle("Entrar na conta", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.titleLabel?.font = UIFont(name: .nunitoBlack, size: 18)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        return signInButton
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.4)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    @objc func signInAction(sender: UIButton) {
        self.delegate?.backToLogin(sender)
    }
    
}

extension CustomAlert {
    func addSubviews() {
        self.addSubview(alertView)
        alertView.addSubview(titleLabel)
        alertView.addSubview(messageLabel)
        alertView.addSubview(signInButton)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupAlertViewConstraints()
        setupTitleLabelConstraints()
        setupMessageLabelConstraints()
        setupSignInButtonConstraints()
    }
    
    func setupAlertViewConstraints() {
        NSLayoutConstraint.activate([
            alertView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            alertView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -38),
            alertView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 38),
            alertView.heightAnchor.constraint(equalTo: alertView.widthAnchor, multiplier: 0.7)
        ])
    }
    
    func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.alertView.topAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: self.alertView.rightAnchor, constant: -20),
            titleLabel.leftAnchor.constraint(equalTo: self.alertView.leftAnchor, constant: 20)
        ])
    }
    
    func setupMessageLabelConstraints() {
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: alertView.centerYAnchor),
            messageLabel.rightAnchor.constraint(equalTo: self.alertView.rightAnchor),
            messageLabel.leftAnchor.constraint(equalTo: self.alertView.leftAnchor),
            messageLabel.heightAnchor.constraint(equalTo: self.alertView.heightAnchor, multiplier: 1.0/4.0)
        ])
    }
    
    func setupSignInButtonConstraints() {
        NSLayoutConstraint.activate([
            signInButton.rightAnchor.constraint(equalTo: self.alertView.rightAnchor, constant: -13),
            signInButton.bottomAnchor.constraint(equalTo: self.alertView.bottomAnchor, constant: -16),
            signInButton.widthAnchor.constraint(equalTo: self.alertView.widthAnchor, multiplier: 0.6),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
