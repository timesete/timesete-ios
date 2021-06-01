//
//  ArticlesTableViewCell.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 01/06/21.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {
    
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
        articleImage.contentMode = .scaleAspectFill
        articleImage.image = UIImage(named: "article-image-1")
        articleImage.clipsToBounds = true
        articleImage.layer.cornerRadius = 8
        articleImage.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        articleImage.translatesAutoresizingMaskIntoConstraints = false
        return articleImage
    }()
    
    private(set) lazy var articleView: UIView = {
        let articleView = UIView()
        articleView.setBackgroundColor(to: .clear)
        articleView.translatesAutoresizingMaskIntoConstraints = false
        return articleView
    }()
    
    private(set) lazy var articleTitle: UILabel = {
        let articleTitle = UILabel()
        articleTitle.text = "Meu amiguinho da escola é autista"
        articleTitle.font = UIFont(name: .nunitoBold, size: 16)
        articleTitle.textColor = .black
        articleTitle.textAlignment = .left
        articleTitle.numberOfLines = 0
        articleTitle.translatesAutoresizingMaskIntoConstraints = false
        return articleTitle
    }()
    
    private(set) lazy var articleSubtitle: UILabel = {
        let articleSubtitle = UILabel()
        articleSubtitle.text = "Como ajudar sua criança a entender mais sobre autismo?"
        articleSubtitle.font = UIFont(name: .nunitoRegular, size: 16)
        articleSubtitle.textColor = .black
        articleSubtitle.textAlignment = .left
        articleSubtitle.numberOfLines = 0
        articleSubtitle.translatesAutoresizingMaskIntoConstraints = false
        return articleSubtitle
    }()
    
    private(set) lazy var learnMoreButton: UIButton = {
        let learnMoreButton = UIButton()
        learnMoreButton.setTitle("Saiba mais", for: .normal)
        learnMoreButton.setTitleColor(.white, for: .normal)
        learnMoreButton.titleLabel?.font = UIFont(name: .nunitoBlack, size: 18)
    
        learnMoreButton.setBackgroundImage(UIImage(named: "cyan-small-button"), for: .normal)
        learnMoreButton.setBackgroundImage(UIImage(named: "cyan-small-dark-button"), for: .highlighted)
        learnMoreButton.addTarget(self, action: #selector(learnMoreAction), for: .touchUpInside)
        learnMoreButton.translatesAutoresizingMaskIntoConstraints = false
        return learnMoreButton
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.setBackgroundColor(to: .appGray04)
        self.contentView.addSubview(contentsView)
        self.contentsView.addSubview(articleImage)
        self.articleImage.addSubview(articleView)
        self.contentsView.addSubview(articleTitle)
        self.contentsView.addSubview(articleSubtitle)
        self.contentsView.addSubview(learnMoreButton)
        
        setupContentsViewConstraints()
        setupArticleImageConstraints()
        setupArticleViewConstraints()
        setupArticleTitleConstraints()
        setupLearnMoreButtonConstraints()
        setupArticleSubtitleConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupContentsViewConstraints() {
        NSLayoutConstraint.activate([
            contentsView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            contentsView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
            contentsView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -24),
            contentsView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 24)
        ])
    }
    
    func setupArticleImageConstraints() {
        NSLayoutConstraint.activate([
            articleImage.topAnchor.constraint(equalTo: self.contentsView.topAnchor),
            articleImage.rightAnchor.constraint(equalTo: self.contentsView.rightAnchor),
            articleImage.leftAnchor.constraint(equalTo: self.contentsView.leftAnchor),
            articleImage.heightAnchor.constraint(equalToConstant: 135)
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
            articleTitle.rightAnchor.constraint(equalTo: self.contentsView.rightAnchor, constant: -20),
            articleTitle.leftAnchor.constraint(equalTo: self.contentsView.leftAnchor, constant: 20),
            articleTitle.topAnchor.constraint(equalTo: self.articleImage.bottomAnchor, constant: 20)
        ])
    }
    
    func setupArticleSubtitleConstraints() {
        NSLayoutConstraint.activate([
            articleSubtitle.rightAnchor.constraint(equalTo: self.contentsView.rightAnchor, constant: -20),
            articleSubtitle.leftAnchor.constraint(equalTo: self.contentsView.leftAnchor, constant: 20),
            articleSubtitle.topAnchor.constraint(equalTo: self.articleTitle.bottomAnchor, constant: 10)
        ])
    }
    
    func setupLearnMoreButtonConstraints() {
        NSLayoutConstraint.activate([
            learnMoreButton.heightAnchor.constraint(equalToConstant: 50),
            learnMoreButton.leftAnchor.constraint(equalTo: self.contentsView.leftAnchor, constant: 20),
            learnMoreButton.bottomAnchor.constraint(equalTo: self.contentsView.bottomAnchor, constant: -20)
        ])
    }
    
    // MARK: Actions
    @objc func learnMoreAction(sender: UIButton) {
        let links = ["https://lunetas.com.br/o-que-e-autismo-fafa-conta/",
                     "https://www.institutoclaro.org.br/educacao/nossas-novidades/noticias/confira-10-livros-sobre-religioes-para-criancas-e-jovens/"]
        if sender.tag == 0 {
            guard let url = URL(string: links[sender.tag]) else { return }
            UIApplication.shared.open(url)
        } else {
            guard let url = URL(string: links[1]) else { return }
            UIApplication.shared.open(url)
        }
    }
}
