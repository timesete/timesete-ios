//
//  StringExtension.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 21/05/21.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}

// Fonts
extension String {
    
    static var nunitoRegular: String {
        return "Nunito-Regular"
    }
    
    static var nunitoBold: String {
        return "Nunito-Bold"
    }
    
    static var nunitoBlack: String {
        return "Nunito-Black"
    }
}
