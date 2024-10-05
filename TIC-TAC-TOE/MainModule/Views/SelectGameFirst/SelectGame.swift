//
//  SelectGame.swift
//  TIC-TAC-TOE
//
//  Created by Кирилл Бахаровский on 10/3/24.
//

import UIKit

class SelectGame: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Game"
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont.customBoldFont(size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let singlePlayerButton: UIButton = {
        let button = UIButton()

        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = AttributedString("Single Player", attributes: AttributeContainer([.font: UIFont.customMediumFont(size: 20)]))
        configuration.image = UIImage(named: "Single-Player-Icon")
        configuration.imagePlacement = .leading
        configuration.imagePadding = 14
        configuration.baseForegroundColor = UIColor.black
        button.configuration = configuration
        
        button.layer.cornerRadius = 30
        button.backgroundColor = UIColor.lightBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let twoPlayersButton: UIButton = {
        let button = UIButton()

        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = AttributedString("Two Players", attributes: AttributeContainer([.font: UIFont.customMediumFont(size: 20)]))
        configuration.image = UIImage(named: "Two-Players-Icon")
        configuration.imagePlacement = .leading
        configuration.imagePadding = 14
        configuration.baseForegroundColor = UIColor.black
        button.configuration = configuration
        
        button.layer.cornerRadius = 30
        button.backgroundColor = UIColor.lightBlue
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 30
        
        self.backgroundColor = UIColor.white
        setupViews()
        setConstrainsts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SelectGame {
    
    private func setupViews() {
        self.addSubview(titleLabel)
        self.addSubview(singlePlayerButton)
        self.addSubview(twoPlayersButton)
    }
    
    private func setConstrainsts() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            singlePlayerButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            singlePlayerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            singlePlayerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            singlePlayerButton.widthAnchor.constraint(equalToConstant: 245),
            singlePlayerButton.heightAnchor.constraint(equalToConstant: 69)
        ])
        
        NSLayoutConstraint.activate([
            twoPlayersButton.topAnchor.constraint(equalTo: singlePlayerButton.bottomAnchor, constant: 20),
            twoPlayersButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            twoPlayersButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            twoPlayersButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            twoPlayersButton.widthAnchor.constraint(equalToConstant: 245),
            twoPlayersButton.heightAnchor.constraint(equalToConstant: 69)
        ])
    }
}
