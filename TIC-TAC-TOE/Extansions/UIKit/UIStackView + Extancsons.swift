//
//  UIStackView + Extancsons.swift
//  UIKit- components
//
//  Created by apple on 9/30/24.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacinng: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacinng
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
