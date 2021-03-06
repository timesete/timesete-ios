//
//  CustomTabBar.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 27/05/21.
//

import UIKit
    
class CustomTabBar: UITabBar {
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        
        // bottom + 80(height of the tab bar in the design) = 114
        size.height = self.notchHeight + 80.0
        return size
     }
}
