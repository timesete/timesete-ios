//
//  ContentsTableViewCell.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 01/06/21.
//

import UIKit

class ContentsTableViewCell: UITableViewCell {

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
    
    private(set) lazy var thumbImage: UIImageView = {
        let thumbImage = UIImageView()
        thumbImage.image = .blondHair01
        thumbImage.contentMode = .scaleAspectFit
        thumbImage.translatesAutoresizingMaskIntoConstraints = false
        return thumbImage
    }()
    
    private(set) lazy var thumbView: UIView = {
        let thumbView = UIView()
        thumbView.setBackgroundColor(to: .appBlack40)
        thumbView.clipsToBounds = true
        thumbView.layer.cornerRadius = 8
        thumbView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        thumbView.translatesAutoresizingMaskIntoConstraints = false
        return thumbView
    }()
    
    private(set) lazy var playButton: UIButton = {
        let playButton = UIButton()
        playButton.setTitle(.none, for: .normal)
        playButton.imageView?.contentMode = .scaleAspectFit
        playButton.setImage(.playButton, for: .normal)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        return playButton
    }()
    
    private(set) lazy var contentTitle: UILabel = {
        let contentTitle = UILabel()
        contentTitle.text = "Título do vídeo"
        contentTitle.font = UIFont(name: .nunitoBold, size: 16)
        contentTitle.textColor = .appBlack
        contentTitle.textAlignment = .left
        contentTitle.numberOfLines = 0
        contentTitle.translatesAutoresizingMaskIntoConstraints = false
        return contentTitle
    }()
    
    private(set) lazy var openOnYoutubeButton: UIButton = {
        let openOnYoutubeButton = UIButton()
        openOnYoutubeButton.setTitle("Abrir no Youtube", for: .normal)
        openOnYoutubeButton.setTitleColor(.white, for: .normal)
        openOnYoutubeButton.titleLabel?.font = UIFont(name: .nunitoBlack, size: 18)
        openOnYoutubeButton.setBackgroundImage(.cyanMiddleButton, for: .normal)
        openOnYoutubeButton.setBackgroundImage(.cyanMiddleDarkButton, for: .highlighted)
        openOnYoutubeButton.translatesAutoresizingMaskIntoConstraints = false
        return openOnYoutubeButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.setBackgroundColor(to: .appGray04)
        self.contentView.addSubview(contentsView)
        self.contentsView.addSubview(thumbImage)
        self.thumbImage.addSubview(thumbView)
        self.thumbView.addSubview(playButton)
        self.contentsView.addSubview(contentTitle)
        self.contentsView.addSubview(openOnYoutubeButton)
        
        setupContentsViewConstraints()
        setupThumbImageConstraints()
        setupThumbViewConstraints()
        setupContentTitleConstraints()
        setupPlayButtonConstraints()
        setupOpenOnYoutubeButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
    
    func setupThumbImageConstraints() {
        NSLayoutConstraint.activate([
            thumbImage.topAnchor.constraint(equalTo: self.contentsView.topAnchor),
            thumbImage.rightAnchor.constraint(equalTo: self.contentsView.rightAnchor),
            thumbImage.leftAnchor.constraint(equalTo: self.contentsView.leftAnchor),
            thumbImage.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    func setupThumbViewConstraints() {
        NSLayoutConstraint.activate([
            thumbView.topAnchor.constraint(equalTo: self.thumbImage.topAnchor),
            thumbView.rightAnchor.constraint(equalTo: self.thumbImage.rightAnchor),
            thumbView.leftAnchor.constraint(equalTo: self.thumbImage.leftAnchor),
            thumbView.bottomAnchor.constraint(equalTo: self.thumbImage.bottomAnchor)
        ])
    }
    
    func setupPlayButtonConstraints() {
        NSLayoutConstraint.activate([
            playButton.centerXAnchor.constraint(equalTo: self.thumbView.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: self.thumbView.centerYAnchor)
        ])
    }
    
    func setupContentTitleConstraints() {
        NSLayoutConstraint.activate([
            contentTitle.topAnchor.constraint(equalTo: self.thumbImage.bottomAnchor, constant: 20),
            contentTitle.rightAnchor.constraint(equalTo: self.contentsView.rightAnchor, constant: -20),
            contentTitle.leftAnchor.constraint(equalTo: self.contentsView.leftAnchor, constant: 20)
        ])
    }
    
    func setupOpenOnYoutubeButtonConstraints() {
        NSLayoutConstraint.activate([
            openOnYoutubeButton.rightAnchor.constraint(equalTo: self.contentsView.rightAnchor, constant: -20),
            openOnYoutubeButton.leftAnchor.constraint(equalTo: self.contentsView.leftAnchor, constant: 20),
            openOnYoutubeButton.bottomAnchor.constraint(equalTo: self.contentsView.bottomAnchor, constant: -20)
//            openOnYoutubeButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
