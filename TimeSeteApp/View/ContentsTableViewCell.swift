//
//  ContentsTableViewCell.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 01/06/21.
//

import UIKit
import youtube_ios_player_helper

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
    
    private(set) lazy var thumbView: YTPlayerView = {
        let thumbView = YTPlayerView()
        thumbView.clipsToBounds = true
        thumbView.layer.cornerRadius = 8
        thumbView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        thumbView.translatesAutoresizingMaskIntoConstraints = false
        return thumbView
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
        openOnYoutubeButton.addTarget(self, action: #selector(openOnYoutubeAction), for: .touchUpInside)
        openOnYoutubeButton.translatesAutoresizingMaskIntoConstraints = false
        return openOnYoutubeButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.setBackgroundColor(to: .appGray04)
        self.contentView.addSubview(contentsView)
        self.contentsView.addSubview(thumbView)
        self.contentsView.addSubview(contentTitle)
        self.contentsView.addSubview(openOnYoutubeButton)
        
        setupContentsViewConstraints()
        setupThumbViewConstraints()
        setupContentTitleConstraints()
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
    
    // MARK: Actions
    
    @objc func playAction(sender: UIButton) {
    
        switch sender.tag {
        case 0:
            thumbView.playVideo()
        default:
            print("teste")
        }
        
    }
    
    @objc func openOnYoutubeAction(sender: UIButton) {
    
        guard let urls = videosURL.getVideosURL() else { return }
        let urlBase = "https://www.youtube.com/watch?v="

        guard let url = URL(string: urlBase + urls[sender.tag]) else { return }
        UIApplication.shared.open(url)
    }

    func setupContentsViewConstraints() {
        NSLayoutConstraint.activate([
            contentsView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            contentsView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
            contentsView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -24),
            contentsView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 24)
        ])
    }
    
    func setupThumbViewConstraints() {
        NSLayoutConstraint.activate([
            thumbView.topAnchor.constraint(equalTo: self.contentsView.topAnchor),
            thumbView.rightAnchor.constraint(equalTo: self.contentsView.rightAnchor),
            thumbView.leftAnchor.constraint(equalTo: self.contentsView.leftAnchor),
            thumbView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    func setupContentTitleConstraints() {
        NSLayoutConstraint.activate([
            contentTitle.topAnchor.constraint(equalTo: self.thumbView.bottomAnchor, constant: 20),
            contentTitle.rightAnchor.constraint(equalTo: self.contentsView.rightAnchor, constant: -20),
            contentTitle.leftAnchor.constraint(equalTo: self.contentsView.leftAnchor, constant: 20)
        ])
    }
    
    func setupOpenOnYoutubeButtonConstraints() {
        NSLayoutConstraint.activate([
            openOnYoutubeButton.rightAnchor.constraint(equalTo: self.contentsView.rightAnchor, constant: -20),
            openOnYoutubeButton.leftAnchor.constraint(equalTo: self.contentsView.leftAnchor, constant: 20),
            openOnYoutubeButton.bottomAnchor.constraint(equalTo: self.contentsView.bottomAnchor, constant: -20)
        ])
    }
}
