//
//  TextFieldExtension.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 21/05/21.
//

import UIKit

extension UITextField {
    
    /// Shows which field is already filled in or which one you are typing
    func setBorderColorIfNeeded(titleLabel: UILabel, errorImage: UIImageView? = nil, warningLabel: UILabel? = nil) {
        guard let view = self.superview else { return }
        
        titleLabel.textColor = .appBlack
        warningLabel?.textColor = .clear
        errorImage?.isHidden = true
        
        if self.hasText || self.isEditing {
            view.layer.borderColor = UIColor.appPurple.cgColor
        } else {
            view.layer.borderColor = UIColor.appGray03.cgColor
        }
    }
    
    /// Shows which field is invalid
    func invalidField(titleLabel: UILabel, errorImage: UIImageView? = nil, warningLabel: UILabel? = nil) {
        guard let view = self.superview else { return }
        
        view.layer.borderColor = UIColor.appRed.cgColor
        titleLabel.textColor = .appRed
        warningLabel?.textColor = .appRed
        errorImage?.isHidden = false
    }
}
