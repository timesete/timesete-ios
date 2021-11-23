//
//  CustomAlertViewController.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 21/11/21.
//

import UIKit

class CustomAlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBackgroundColor(to: .appBlack40)
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve

        addSubviews()
        setupConstraints()
    }

    private(set) lazy var alertView: UIView = {
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
        titleLabel.text = "Verifique sua conta"
        titleLabel.font = UIFont(name: .nunitoBold, size: 20)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    private lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.textColor = .appBlack
        messageLabel.text = "\n\tPara criar um novo amigo você\n\tprecisa estar conectado em uma\n\tconta.\n"
        messageLabel.font = UIFont(name: .nunitoRegular, size: 16)
        messageLabel.layer.borderWidth = 1
        messageLabel.layer.borderColor = UIColor.appGray04.cgColor
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .left
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        return messageLabel
    }()

    private(set) lazy var buttonsStackView: UIStackView = {
        let buttonsStackView = UIStackView()
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fill
        buttonsStackView.alignment = .center
        buttonsStackView.spacing = 8
        buttonsStackView.backgroundColor = .clear
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        return buttonsStackView
    }()

    private(set) lazy var cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.imageView?.contentMode = .scaleAspectFit
        cancelButton.setImage(.cancelButton, for: .normal)
        cancelButton.setImage(.cancelDarkButton, for: .highlighted)
        cancelButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        return cancelButton
    }()

    private(set) lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.imageView?.contentMode = .scaleAspectFit
        loginButton.setBackgroundImage(.sPurpleButton, for: .normal)
        loginButton.setBackgroundImage(.sPurpleDarkButton, for: .highlighted)
        loginButton.setTitle("Entrar na conta", for: .normal)
        loginButton.titleLabel?.font = UIFont(name: .nunitoBlack, size: 18)
        loginButton.setContentHuggingPriority(.required, for: .vertical)
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()

    @objc func cancelAction(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @objc func loginAction(sender: UIButton) {
        dismiss(animated: true, completion: nil)
//        guard let viewController = self.next as? UIViewController else { return }
//        viewController.dismiss(animated: true, completion: nil)
    }
}

extension CustomAlertViewController {

    // MARK: Subviews
    func addSubviews() {
        view.addSubview(alertView)
        alertView.addSubview(titleLabel)
        alertView.addSubview(messageLabel)
        alertView.addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(cancelButton)
        buttonsStackView.addArrangedSubview(loginButton)
    }

    // MARK: Setup Constraints
    func setupConstraints() {
        setupAlertViewConstraints()
        setupTitleLabelConstraints()
        setupMessageLabelConstraints()
        setupButtonsStackViewConstraints()
    }

    func setupAlertViewConstraints() {
        NSLayoutConstraint.activate([
            alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertView.heightAnchor.constraint(equalToConstant: 246),
            alertView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }

    func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: alertView.rightAnchor, constant: -20),
            titleLabel.leftAnchor.constraint(equalTo: alertView.leftAnchor, constant: 20)
        ])
    }

    func setupMessageLabelConstraints() {
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: alertView.centerYAnchor),
            messageLabel.rightAnchor.constraint(equalTo: alertView.rightAnchor),
            messageLabel.leftAnchor.constraint(equalTo: alertView.leftAnchor)
        ])
    }

    func setupButtonsStackViewConstraints() {
        NSLayoutConstraint.activate([
            buttonsStackView.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -8),
            buttonsStackView.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 8),
            buttonsStackView.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -4)
        ])
    }
}
