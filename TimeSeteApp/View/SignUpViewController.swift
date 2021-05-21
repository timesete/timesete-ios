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
    
    // Footer
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
}

extension SignUpViewController {
    
    // MARK: Subviews
    func addSubviews() {
        self.view.addSubview(headerStackView)
        self.headerStackView.addArrangedSubview(titleLabel)
        self.headerStackView.addArrangedSubview(pageImage)
        self.view.addSubview(signInStackView)
        self.signInStackView.addArrangedSubview(signInLabel)
        self.signInStackView.addArrangedSubview(signInButton)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupHeaderStackViewConstraints()
        setupSignInStackViewConstraints()
    }
    
    // Header
    func setupHeaderStackViewConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8),
            headerStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            headerStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20)
        ])
    }
    
    // Footer
    func setupSignInStackViewConstraints() {
        NSLayoutConstraint.activate([
            signInStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            signInStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
}
