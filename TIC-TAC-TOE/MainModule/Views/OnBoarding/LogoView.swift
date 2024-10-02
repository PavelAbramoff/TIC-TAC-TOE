//
//  LogoView.swift
//  TIC-TAC-TOE
//
//  Created by Кирилл Бахаровский on 10/2/24.
//

import UIKit

class LogoView: UIView {
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logoImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "TIC-TAC-TOE"
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont.customBoldFont(size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstrainsts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LogoView {
    
    private func setupViews() {
        self.addSubview(image)
        self.addSubview(textLabel)
    }
    
    private func setConstrainsts() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            image.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 31),
            textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}
