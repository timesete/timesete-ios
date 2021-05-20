//
//  SignUpView.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 20/05/21.
//

import UIKit

protocol SignUpViewProtocol: class {
    func cancelButtonTapped()
}

class SignUpView: UIView {

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Insira suas informações de acesso"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .appBlack
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setBackgroundColor(to: .appGray04)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SignUpView {
    
    // MARK: Subviews
    func addSubviews() {
        self.addSubview(titleLabel)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupTitleLabelConstraints()
    }
    
    // Header
    func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20)
        ])
    }
}
