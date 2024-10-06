//
//  BigButton.swift
//  UIKit- components
//
//  Created by apple on 10/1/24.
//

import UIKit

class BigButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String) {
        self.init(type: .system)
        setTitle(text, for: .normal)
//        self.backgroundColor = .purple
        configuure(text: text)
    }
    
    private func configuure(text: String) {
        if text == "Picked" {
            backgroundColor = .blue
            tintColor = .white
        } else {
            backgroundColor = .background
            tintColor = .black
        }
        
        layer.cornerRadius = 20
        titleLabel?.font = .boldSystemFont(ofSize: 15)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

