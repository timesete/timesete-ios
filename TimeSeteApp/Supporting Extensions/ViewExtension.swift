//
//  ViewExtension.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 19/05/21.
//

import UIKit

extension UIView {
    
    func setBackgroundColor(to color: UIColor) {
        self.backgroundColor = color
    }
    
    var notchHeight: CGFloat {
        return self.window?.safeAreaInsets.bottom ?? 0
    }
}
