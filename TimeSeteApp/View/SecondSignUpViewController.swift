//
//  SecondSignUpViewController.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 21/05/21.
//

import UIKit

class SecondSignUpViewController: UIViewController, SecondSignUpPresenterDelegate {
    
    let presenter = SecondSignUpPresenter()
    private var pickerView = UIPickerView()
    private let answerCharacterLimit = 16
    
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
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
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
        titleLabel.text = "Defina sua recuperação de senha"
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
    private(set) lazy var questionStackView: UIStackView = {
        let questionStackView = UIStackView()
        questionStackView.axis = .vertical
        questionStackView.distribution = .fill
        questionStackView.spacing = 4
        questionStackView.backgroundColor = .clear
        questionStackView.translatesAutoresizingMaskIntoConstraints = false
        return questionStackView
    }()
    
    private(set) lazy var questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.text = "Pergunta de segurança para senha"
        questionLabel.textAlignment = .left
        questionLabel.textColor = .appBlack
        questionLabel.font = UIFont(name: .nunitoRegular, size: 16)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        return questionLabel
    }()
    
    private(set) lazy var questionView: UIView = {
        let questionView = UIView()
        questionView.backgroundColor = .white
        questionView.layer.cornerRadius = 4
        questionView.layer.borderWidth = 1
        questionView.layer.borderColor = UIColor.appPurple.cgColor
        questionView.translatesAutoresizingMaskIntoConstraints = false
        return questionView
    }()
    
    private(set) lazy var questionTextField: UITextField = {
        let questionTextField = UITextField()
        questionTextField.text = "Qual o sobrenome da sua avó?"
        questionTextField.font = UIFont(name: .nunitoRegular, size: 16)
        questionTextField.inputView = pickerView
        questionTextField.borderStyle = .none
        questionTextField.backgroundColor = .clear
        questionTextField.tintColor = .clear
        questionTextField.translatesAutoresizingMaskIntoConstraints = false
        return questionTextField
    }()
    
    private(set) lazy var questionWarningLabel: UILabel = {
        let questionWarningLabel = UILabel()
        questionWarningLabel.text = "Selecione uma pergunta"
        questionWarningLabel.textAlignment = .left
        questionWarningLabel.textColor = .clear
        questionWarningLabel.font = UIFont(name: .nunitoRegular, size: 12)
        questionWarningLabel.translatesAutoresizingMaskIntoConstraints = false
        return questionWarningLabel
    }()
    
    private(set) lazy var answerLabel: UILabel = {
        let answerLabel = UILabel()
        answerLabel.text = "Resposta secreta"
        answerLabel.textAlignment = .left
        answerLabel.textColor = .appBlack
        answerLabel.font = UIFont(name: .nunitoRegular, size: 16)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        return answerLabel
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
        answerTextField.keyboardType = .default
        answerTextField.autocapitalizationType = .sentences
        answerTextField.autocorrectionType = .no
        answerTextField.tintColor = .appPurple
        answerTextField.translatesAutoresizingMaskIntoConstraints = false
        return answerTextField
    }()
    
    private(set) lazy var characterLimitLabel: UILabel = {
        let characterLimitLabel = UILabel()
        characterLimitLabel.text = "0/16"
        characterLimitLabel.textAlignment = .right
        characterLimitLabel.textColor = .appGray01
        characterLimitLabel.font = UIFont(name: .nunitoRegular, size: 12)
        characterLimitLabel.translatesAutoresizingMaskIntoConstraints = false
        return characterLimitLabel
    }()
    
    // Footer
    private(set) lazy var registerAccountButton: UIButton = {
        let registerAccountButton = UIButton()
        registerAccountButton.setBackgroundImage(.cyanButton, for: .normal)
        registerAccountButton.setTitle("Cadastrar conta", for: .normal)
        registerAccountButton.setTitleColor(.white, for: .normal)
        registerAccountButton.setTitleColor(.gray, for: .highlighted)
        registerAccountButton.titleLabel?.font = UIFont(name: .nunitoBlack, size: 18)
        registerAccountButton.translatesAutoresizingMaskIntoConstraints = false
        registerAccountButton.addTarget(self, action: #selector(registerAccountAction), for: .touchUpInside)
        return registerAccountButton
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
    @objc func pageOneAction(sender: UIButton) {
        presenter.backToSignUp()
    }
    
    @objc func registerAccountAction(sender: UIButton) {
        guard let answerText = answerTextField.text else { return }
        
        if answerText.count > 0 {
            presenter.goToHome()
        } else {
            answerTextField.invalidField(titleLabel: answerLabel)
        }
    }
    
    @objc func signInAction(sender: UIButton) {
        presenter.backToLogin()
    }
}

// MARK: Text Field
extension SecondSignUpViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.setBorderColorIfNeeded(titleLabel: answerLabel)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.setBorderColorIfNeeded(titleLabel: answerLabel)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let characterAmount = textField.text?.count else { return }
        
        if characterAmount > answerCharacterLimit {
            textField.text?.removeLast()
        } else {
            characterLimitLabel.text = "\(characterAmount)/\(answerCharacterLimit)"
        }
    }
}

// MARK: Picker View
extension SecondSignUpViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        questionTextField.text = "Qual o sobrenome da sua avó?"
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Qual o sobrenome da sua avó?"
    }
}
