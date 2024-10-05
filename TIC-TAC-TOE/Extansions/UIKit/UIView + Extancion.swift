//
//  UIView + Extancion.swift
//  UIKit- components
//
//  Created by apple on 10/3/24.
//

import UIKit

extension UIView {
    
    func addShadowOnView() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 10
    }
}
