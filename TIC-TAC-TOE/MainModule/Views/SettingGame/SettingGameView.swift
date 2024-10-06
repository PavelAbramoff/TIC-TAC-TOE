//
//  SettingGameView.swift
//  UIKit- components
//
//  Created by apple on 9/30/24.
//

import UIKit
import Foundation

class SettingGameView: UIView {
    
    let defaults = UserDefaults.standard
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let gameTameBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .background
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let gameTimeLabel = UILabel(text: "Game Time",
                                        font: .boldSystemFont(ofSize: 25),
                                        textColor: .black)
                                        
    private let repeatSwitch: UISwitch = {
        let repeatSwitch = UISwitch()
//        repeatSwitch.isOn = false
        repeatSwitch.onTintColor = .blue
        repeatSwitch.addTarget(self, action: #selector(repateSwitchToggled), for: .valueChanged)
        repeatSwitch.translatesAutoresizingMaskIntoConstraints = false
        return repeatSwitch
    }()
    
    private lazy var gameTimeStackView = UIStackView(arrangedSubviews: [gameTimeLabel, repeatSwitch],
                                                     axis: .horizontal,
                                                     spacinng: 10)
    
    private let durationTameBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .background
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let durationLabel = UILabel(text: "Duration",
                                        font: .boldSystemFont(ofSize: 25),
                                        textColor: .black)
    
    private let spaserView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var firstTimeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("30 min", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.tintColor = .black
//        button.alpha = 0
        button.semanticContentAttribute = .forceRightToLeft
        button.addTarget(self, action: #selector(changeTime), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var secondTimeButton: UIButton = {
        let button = UIButton(type: .system)
//        button.backgroundColor = .purple
        button.setTitle("60 min", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.tintColor = .black
//        button.alpha = 0
        button.semanticContentAttribute = .forceRightToLeft
        button.addTarget(self, action: #selector(changeTime), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var thirdTimeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("120 min", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.tintColor = .black
//        button.alpha = 0
        button.semanticContentAttribute = .forceRightToLeft
        button.addTarget(self, action: #selector(changeTime), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addShadowOnView()
        setupView()
        setConstraints()
        
        if let myValue = defaults.object(forKey: "GameTimeDuration") {
            let gameTimeDuration = myValue
            
            selectNewTime(time: gameTimeDuration as! Int)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(backView)
        addSubview(gameTameBackView)
        addSubview(gameTimeStackView)
        addSubview(durationTameBackView)
        addSubview(durationLabel)
        addSubview(spaserView)
        addSubview(firstTimeButton)
        addSubview(secondTimeButton)
        addSubview(thirdTimeButton)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func repateSwitchToggled() {
        if repeatSwitch.isOn {
            selectNewTime(time: 60)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.firstTimeButton.alpha = 1
                self.secondTimeButton.alpha = 1
                self.thirdTimeButton.alpha = 1
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.firstTimeButton.alpha = 0
                self.secondTimeButton.alpha = 0
                self.thirdTimeButton.alpha = 0
            })
            
            defaults.set(0, forKey: "GameTimeDuration")
        }
    }
    
    @objc func changeTime(btn: UIButton) {
        let str = btn.currentTitle!
        let ch = Character(" ")
        let result = str.split(separator: ch)
        let timeStr: String = String(result[0])
        let time = Int(timeStr)!
        
        selectNewTime(time: time)
    }
    
    func selectNewTime(time: Int) {
        defaults.set(time, forKey: "GameTimeDuration")
        
        switch time {
        case 0:
            repeatSwitch.isOn = false
            firstTimeButton.backgroundColor = .background
            secondTimeButton.backgroundColor = .background
            thirdTimeButton.backgroundColor = .background
            firstTimeButton.alpha = 0
            secondTimeButton.alpha = 0
            thirdTimeButton.alpha = 0
        case 30:
            repeatSwitch.isOn = true
            firstTimeButton.backgroundColor = .purple
            secondTimeButton.backgroundColor = .background
            thirdTimeButton.backgroundColor = .background
            firstTimeButton.alpha = 1
            secondTimeButton.alpha = 1
            thirdTimeButton.alpha = 1
        case 60:
            repeatSwitch.isOn = true
            firstTimeButton.backgroundColor = .background
            secondTimeButton.backgroundColor = .purple
            thirdTimeButton.backgroundColor = .background
            firstTimeButton.alpha = 1
            secondTimeButton.alpha = 1
            thirdTimeButton.alpha = 1
        case 120:
            repeatSwitch.isOn = true
            firstTimeButton.backgroundColor = .background
            secondTimeButton.backgroundColor = .background
            thirdTimeButton.backgroundColor = .purple
            firstTimeButton.alpha = 1
            secondTimeButton.alpha = 1
            thirdTimeButton.alpha = 1
        default:
            repeatSwitch.isOn = false
            firstTimeButton.backgroundColor = .background
            secondTimeButton.backgroundColor = .background
            thirdTimeButton.backgroundColor = .background
            firstTimeButton.alpha = 0
            secondTimeButton.alpha = 0
            thirdTimeButton.alpha = 0
        }
        
    }
}

extension SettingGameView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            gameTameBackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 20),
            gameTameBackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            gameTameBackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
            gameTameBackView.heightAnchor.constraint(equalToConstant: 69),
            
            gameTimeStackView.centerYAnchor.constraint(equalTo: gameTameBackView.centerYAnchor),
            gameTimeStackView.leadingAnchor.constraint(equalTo: gameTameBackView.leadingAnchor, constant: 20),
            gameTimeStackView.trailingAnchor.constraint(equalTo: gameTameBackView.trailingAnchor, constant: -20),
            
            durationTameBackView.topAnchor.constraint(equalTo: gameTameBackView.bottomAnchor, constant: 20),
            durationTameBackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            durationTameBackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
            durationTameBackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20),
            
            durationLabel.topAnchor.constraint(equalTo: durationTameBackView.topAnchor, constant: 20),
            durationLabel.leadingAnchor.constraint(equalTo: durationTameBackView.leadingAnchor, constant: 20),
            durationLabel.trailingAnchor.constraint(equalTo: durationTameBackView.trailingAnchor, constant: 20),
            durationLabel.heightAnchor.constraint(equalToConstant: 24),
            
            spaserView.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: 10),
            spaserView.leadingAnchor.constraint(equalTo: durationTameBackView.leadingAnchor, constant: 0),
            spaserView.trailingAnchor.constraint(equalTo: durationTameBackView.trailingAnchor, constant: 0),
            spaserView.heightAnchor.constraint(equalToConstant: 2),
            
            firstTimeButton.topAnchor.constraint(equalTo: spaserView.bottomAnchor),
            firstTimeButton.leadingAnchor.constraint(equalTo: durationTameBackView.leadingAnchor),
            firstTimeButton.trailingAnchor.constraint(equalTo: durationTameBackView.trailingAnchor),
            firstTimeButton.heightAnchor.constraint(equalToConstant: 50),
            
            secondTimeButton.topAnchor.constraint(equalTo: firstTimeButton.bottomAnchor),
            secondTimeButton.leadingAnchor.constraint(equalTo: durationTameBackView.leadingAnchor),
            secondTimeButton.trailingAnchor.constraint(equalTo: durationTameBackView.trailingAnchor),
            secondTimeButton.heightAnchor.constraint(equalToConstant: 50),
            
            thirdTimeButton.topAnchor.constraint(equalTo: secondTimeButton.bottomAnchor),
            thirdTimeButton.leadingAnchor.constraint(equalTo: durationTameBackView.leadingAnchor),
            thirdTimeButton.trailingAnchor.constraint(equalTo: durationTameBackView.trailingAnchor),
            thirdTimeButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
}
