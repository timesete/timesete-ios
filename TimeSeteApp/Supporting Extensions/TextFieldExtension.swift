//
//  TextFieldExtension.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 21/05/21.
//

import UIKit

extension UITextField {
    func setBorderColorIfNeeded(view: UIView?) {
        guard let view = view else { return }
        
        if self.hasText || self.isEditing {
            view.layer.borderColor = UIColor.appPurple.cgColor
        } else {
            view.layer.borderColor = UIColor.appGray03.cgColor
        }
    }
}
