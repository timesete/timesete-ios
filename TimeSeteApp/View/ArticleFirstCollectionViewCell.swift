//
//  ArticleFirstCollectionViewCell.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 01/06/21.
//

import UIKit

class ArticleFirstCollectionViewCell: UICollectionViewCell {
    
    private(set) lazy var contentsView: UIView = {
        let contentsView = UIView()
        contentsView.setBackgroundColor(to: .white)
        contentsView.layer.cornerRadius = 8
        contentsView.layer.applySketchShadow(color: .appGray03,
                                             alpha: 0.1,
                                             posX: 0,
                                             posY: 6,
                                             blur: 9,
                                             spread: 0)
    
        contentsView.translatesAutoresizingMaskIntoConstraints = false
        return contentsView
    }()
    
    private(set) lazy var articleImage: UIImageView = {
        let articleImage = UIImageView()
        articleImage.contentMode = .scaleAspectFit
        articleImage.translatesAutoresizingMaskIntoConstraints = false
        return articleImage
    }()
    
    private(set) lazy var articleView: UIView = {
        let articleView = UIView()
        articleView.setBackgroundColor(to: .appBlack40)
        articleView.translatesAutoresizingMaskIntoConstraints = false
        return articleView
    }()
    
    private(set) lazy var articleTitle: UILabel = {
        let articleTitle = UILabel()
        articleTitle.text = "Meu amiguinho da escola é autista"
        articleTitle.font = UIFont(name: .nunitoBlack, size: 16)
        articleTitle.textColor = .blue
        articleTitle.textAlignment = .center
        articleTitle.numberOfLines = 0
        articleTitle.translatesAutoresizingMaskIntoConstraints = false
        return articleTitle
    }()
    
    private(set) lazy var learnMoreButton: UIButton = {
        let learnMoreButton = UIButton()
        learnMoreButton.setTitle("Saiba mais", for: .normal)
        learnMoreButton.setTitleColor(.appCyan, for: .normal)
        learnMoreButton.titleLabel?.font = UIFont(name: .nunitoBlack, size: 18)
        
        learnMoreButton.addTarget(self, action: #selector(learnMoreAction), for: .touchUpInside)
        learnMoreButton.translatesAutoresizingMaskIntoConstraints = false
        return learnMoreButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.setBackgroundColor(to: .appGray04)
        self.contentView.addSubview(contentsView)
        self.contentsView.addSubview(articleImage)
        self.articleImage.addSubview(articleView)
        self.articleView.addSubview(articleTitle)
        self.contentsView.addSubview(learnMoreButton)
        
        setupContentsViewConstraints()
        setupArticleImageConstraints()
        setupArticleViewConstraints()
        setupArticleTitleConstraints()
        setupLearnMoreButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContentsViewConstraints() {
        NSLayoutConstraint.activate([
            contentsView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            contentsView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
            contentsView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0),
            contentsView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0)
        ])
    }
    
    func setupArticleImageConstraints() {
        NSLayoutConstraint.activate([
            articleImage.topAnchor.constraint(equalTo: self.contentsView.topAnchor),
            articleImage.rightAnchor.constraint(equalTo: self.contentsView.rightAnchor),
            articleImage.leftAnchor.constraint(equalTo: self.contentsView.leftAnchor),
            articleImage.heightAnchor.constraint(equalToConstant: 186)
        ])
    }
    
    func setupArticleViewConstraints() {
        NSLayoutConstraint.activate([
            articleView.topAnchor.constraint(equalTo: self.contentsView.topAnchor),
            articleView.rightAnchor.constraint(equalTo: self.contentsView.rightAnchor),
            articleView.leftAnchor.constraint(equalTo: self.contentsView.leftAnchor),
            articleView.bottomAnchor.constraint(equalTo: self.articleImage.bottomAnchor)
        ])
    }
    
    func setupArticleTitleConstraints() {
        NSLayoutConstraint.activate([
            articleTitle.centerYAnchor.constraint(equalTo: self.articleView.centerYAnchor),
            articleTitle.rightAnchor.constraint(equalTo: self.articleView.rightAnchor, constant: -30),
            articleView.leftAnchor.constraint(equalTo: self.articleView.leftAnchor, constant: 30)
        ])
    }
    
    func setupLearnMoreButtonConstraints() {
        NSLayoutConstraint.activate([
            learnMoreButton.topAnchor.constraint(equalTo: self.articleView.bottomAnchor),
            learnMoreButton.rightAnchor.constraint(equalTo: self.contentsView.rightAnchor, constant: -15),
            learnMoreButton.leftAnchor.constraint(equalTo: self.contentsView.leftAnchor, constant: 15),
            learnMoreButton.bottomAnchor.constraint(equalTo: self.contentsView.bottomAnchor)
        ])
    }
    
    // MARK: Actions
    @objc func learnMoreAction(sender: UIButton) {
        
    }
}
