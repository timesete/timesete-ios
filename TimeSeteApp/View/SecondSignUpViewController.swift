//
//  SecondSignUpViewController.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 21/05/21.
//

import UIKit

class SecondSignUpViewController: UIViewController, SecondSignUpPresenterDelegate {

    private let presenter = SecondSignUpPresenter()
    
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
        titleLabel.text = "Defina sua recuperação de senha"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .appBlack
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var pageImage: UIImageView = {
        let pageImage = UIImageView()
        pageImage.image = .pageTwo
        pageImage.contentMode = .scaleAspectFit
        pageImage.translatesAutoresizingMaskIntoConstraints = false
        return pageImage
    }()
    
    private lazy var pageOneButton: UIButton = {
        let pageOneButton = UIButton()
        pageOneButton.backgroundColor = .clear
        pageOneButton.setTitle(.none, for: .normal)
        pageOneButton.translatesAutoresizingMaskIntoConstraints = false
        pageOneButton.addTarget(self, action: #selector(pageOneAction), for: .touchUpInside)
        return pageOneButton
    }()
    
    // Main
    private lazy var questionStackView: UIStackView = {
        let questionStackView = UIStackView()
        questionStackView.axis = .vertical
        questionStackView.distribution = .fill
        questionStackView.spacing = 4
        questionStackView.backgroundColor = .clear
        questionStackView.translatesAutoresizingMaskIntoConstraints = false
        return questionStackView
    }()
    
    private lazy var questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.text = "Pergunta de segurança para senha"
        questionLabel.textAlignment = .left
        questionLabel.textColor = .appBlack
        questionLabel.font = UIFont.systemFont(ofSize: 16)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        return questionLabel
    }()
    
    private lazy var questionView: UIView = {
        let questionView = UIView()
        questionView.backgroundColor = .white
        questionView.layer.cornerRadius = 4
        questionView.layer.borderWidth = 1
        questionView.layer.borderColor = UIColor.appGray03.cgColor
        questionView.translatesAutoresizingMaskIntoConstraints = false
        return questionView
    }()
    
    private lazy var questionTextField: UITextField = {
        let questionTextField = UITextField()
        questionTextField.placeholder = "Insira seu e-mail"
        questionTextField.borderStyle = .none
        questionTextField.backgroundColor = .clear
        questionTextField.keyboardType = .emailAddress
        questionTextField.autocapitalizationType = .none
        questionTextField.autocorrectionType = .no
        questionTextField.tintColor = .appPurple
        questionTextField.translatesAutoresizingMaskIntoConstraints = false
        return questionTextField
    }()
    
    private lazy var questionWarningLabel: UILabel = {
        let questionWarningLabel = UILabel()
        questionWarningLabel.text = "Selecione uma pergunta"
        questionWarningLabel.textAlignment = .left
        questionWarningLabel.textColor = .clear
        questionWarningLabel.font = UIFont.systemFont(ofSize: 12)
        questionWarningLabel.translatesAutoresizingMaskIntoConstraints = false
        return questionWarningLabel
    }()
    
    private lazy var answerLabel: UILabel = {
        let answerLabel = UILabel()
        answerLabel.text = "Resposta secreta"
        answerLabel.textAlignment = .left
        answerLabel.textColor = .appBlack
        answerLabel.font = UIFont.systemFont(ofSize: 16)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        return answerLabel
    }()
    
    private lazy var answerView: UIView = {
        let answerView = UIView()
        answerView.backgroundColor = .white
        answerView.layer.cornerRadius = 4
        answerView.layer.borderWidth = 1
        answerView.layer.borderColor = UIColor.appGray03.cgColor
        answerView.translatesAutoresizingMaskIntoConstraints = false
        return answerView
    }()
    
    private lazy var answerTextField: UITextField = {
        let answerTextField = UITextField()
        answerTextField.placeholder = "Insira sua resposta"
        answerTextField.borderStyle = .none
        answerTextField.backgroundColor = .clear
        answerTextField.keyboardType = .default
        answerTextField.autocapitalizationType = .sentences
        answerTextField.autocorrectionType = .no
        answerTextField.tintColor = .appPurple
        answerTextField.translatesAutoresizingMaskIntoConstraints = false
        return answerTextField
    }()
    
    private lazy var characterLimitLabel: UILabel = {
        let characterLimitLabel = UILabel()
        characterLimitLabel.text = "0/16"
        characterLimitLabel.textAlignment = .right
        characterLimitLabel.textColor = .appGray01
        characterLimitLabel.font = UIFont.systemFont(ofSize: 12)
        characterLimitLabel.translatesAutoresizingMaskIntoConstraints = false
        return characterLimitLabel
    }()
    
    // Footer
    private lazy var registerAccountButton: UIButton = {
        let registerAccountButton = UIButton()
        registerAccountButton.setBackgroundImage(.cyanButton, for: .normal)
        registerAccountButton.setTitle("Cadastrar conta", for: .normal)
        registerAccountButton.setTitleColor(.white, for: .normal)
        registerAccountButton.setTitleColor(.gray, for: .highlighted)
        registerAccountButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        registerAccountButton.translatesAutoresizingMaskIntoConstraints = false
        registerAccountButton.addTarget(self, action: #selector(registerAccountAction), for: .touchUpInside)
        return registerAccountButton
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
    @objc func pageOneAction(sender: UIButton) {
        presenter.backToSignUp()
    }
    
    @objc func registerAccountAction(sender: UIButton) {
        // TODO: go to home
    }
    
    @objc func signInAction(sender: UIButton) {
        presenter.backToLogin()
    }
}

extension SecondSignUpViewController {
    
    // MARK: Subviews
    func addSubviews() {
        self.view.addSubview(headerStackView)
        self.headerStackView.addArrangedSubview(titleLabel)
        self.headerStackView.addArrangedSubview(pageImage)
        self.view.insertSubview(pageOneButton, aboveSubview: headerStackView)
        
        self.view.addSubview(questionStackView)
        self.questionView.addSubview(questionTextField)
        self.questionStackView.addArrangedSubview(questionLabel)
        self.questionStackView.addArrangedSubview(questionView)
        self.questionStackView.addArrangedSubview(questionWarningLabel)
        self.answerView.addSubview(answerTextField)
        self.questionStackView.addArrangedSubview(answerLabel)
        self.questionStackView.addArrangedSubview(answerView)
        self.questionStackView.addArrangedSubview(characterLimitLabel)
        
        self.view.addSubview(registerAccountButton)
        self.view.addSubview(signInStackView)
        self.signInStackView.addArrangedSubview(signInLabel)
        self.signInStackView.addArrangedSubview(signInButton)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupHeaderStackViewConstraints()
        setupPageOneButtonConstraints()
        setupQuestionStackViewConstraints()
        setupQuestionViewConstraints()
        setupQuestionTextFieldConstraints()
        setupAnswerViewConstraints()
        setupAnswerTextFieldConstraints()
        setupRegisterAccountButtonConstraints()
        setupSignInStackViewConstraints()
        
        self.questionStackView.setCustomSpacing(8, after: self.questionLabel)
        self.questionStackView.setCustomSpacing(20, after: self.questionWarningLabel)
        self.questionStackView.setCustomSpacing(8, after: self.answerLabel)
    }
    
    // Header
    func setupHeaderStackViewConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
            headerStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24),
            headerStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -24)
        ])
    }
    
    func setupPageOneButtonConstraints() {
        guard let viewWidth = self.presenter.getViewWidth() else { return }
        
        NSLayoutConstraint.activate([
            pageOneButton.bottomAnchor.constraint(equalTo: self.headerStackView.bottomAnchor),
            pageOneButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -viewWidth/2),
            pageOneButton.heightAnchor.constraint(equalTo: self.pageImage.heightAnchor),
            pageOneButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    // Main
    func setupQuestionStackViewConstraints() {
        NSLayoutConstraint.activate([
            questionStackView.topAnchor.constraint(equalTo: self.headerStackView.bottomAnchor, constant: 24),
            questionStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24),
            questionStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -24)
        ])
    }
    
    func setupQuestionViewConstraints() {
        questionView.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func setupQuestionTextFieldConstraints() {
        questionTextField.rightAnchor.constraint(equalTo: self.questionView.rightAnchor, constant: -12).isActive = true
        questionTextField.leftAnchor.constraint(equalTo: self.questionView.leftAnchor, constant: 12).isActive = true
        questionTextField.topAnchor.constraint(equalTo: self.questionView.topAnchor, constant: 5).isActive = true
        questionTextField.bottomAnchor.constraint(equalTo: self.questionView.bottomAnchor, constant: -5).isActive = true
    }
    
    func setupAnswerViewConstraints() {
        answerView.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func setupAnswerTextFieldConstraints() {
        answerTextField.rightAnchor.constraint(equalTo: self.answerView.rightAnchor, constant: -12).isActive = true
        answerTextField.leftAnchor.constraint(equalTo: self.answerView.leftAnchor, constant: 12).isActive = true
        answerTextField.topAnchor.constraint(equalTo: self.answerView.topAnchor, constant: 5).isActive = true
        answerTextField.bottomAnchor.constraint(equalTo: self.answerView.bottomAnchor, constant: -5).isActive = true
    }
    
    // Footer
    func setupRegisterAccountButtonConstraints() {
        NSLayoutConstraint.activate([
            registerAccountButton.bottomAnchor.constraint(equalTo: self.signInStackView.topAnchor, constant: -68),
            registerAccountButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
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
extension SecondSignUpViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.setBorderColorIfNeeded(view: textField.superview)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.setBorderColorIfNeeded(view: textField.superview)
    }
}
