//
//  CloseButton.swift
//  UIKit- components
//
//  Created by apple on 9/30/24.
//

import UIKit

class ReturnButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setBackgroundImage(UIImage(named: "Back-Icon"), for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
