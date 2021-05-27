//
//  CustomTabBar.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 27/05/21.
//

import UIKit
    
class CustomTabBar: UITabBar {
    
    var hasNotch: Bool {
        let bottom = self.window?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
 
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        // bottom + 80(height of the tab bar in the design) = 114
        size.height = hasNotch ? 114 : 80
        return size
     }
}
