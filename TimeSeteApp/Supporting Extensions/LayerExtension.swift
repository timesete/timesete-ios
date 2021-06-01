//
//  LayerExtension.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 01/06/21.
//

import UIKit

extension CALayer {
  func applySketchShadow(color: UIColor, alpha: Float,
                         posX: CGFloat, posY: CGFloat,
                         blur: CGFloat, spread: CGFloat = 0) {
    
    masksToBounds = false
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: posX, height: posY)
    shadowRadius = blur / 2.0
    
    if spread == 0 {
      shadowPath = nil
    } else {
      let newdx = -spread
      let rect = bounds.insetBy(dx: newdx, dy: newdx)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
  }
}
