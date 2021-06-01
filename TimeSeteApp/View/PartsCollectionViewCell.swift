//
//  PartsCollectionViewCell.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 30/05/21.
//

import UIKit

class PartsCollectionViewCell: UICollectionViewCell {
    
    private(set) lazy var partImage: UIImageView = {
        let partImage = UIImageView()
        partImage.setBackgroundColor(to: .clear)
        partImage.translatesAutoresizingMaskIntoConstraints = false
        return partImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(partImage)
        setupPartImageConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPartImageConstraints() {
        NSLayoutConstraint.activate([
            partImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            partImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            partImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            partImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor)
        ])
    }
}
