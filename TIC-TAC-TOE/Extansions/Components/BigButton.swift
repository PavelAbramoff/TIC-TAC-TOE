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
    
    convenience init(tag: Int) {
        self.init(type: .system)
//        setTitle(text, for: .normal)
        configuure(tag: tag)
    }
    
    private func configuure(tag: Int) {
        backgroundColor = .background
        tintColor = .black
        
        self.tag = tag
        layer.cornerRadius = 20
        titleLabel?.font = .boldSystemFont(ofSize: 15)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

