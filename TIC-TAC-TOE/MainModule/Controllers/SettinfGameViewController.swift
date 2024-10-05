//
//  SettinfGameViewController.swift
//  UIKit- components
//
//  Created by apple on 9/30/24.
//

import UIKit

class SettinfGameViewController: UIViewController {
    
    private lazy var returnButton = ReturnButton(type: .system)
    
    private let gameTimeView = SettingGameView()
    
    private let items = ChangeItems()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    @objc func returnToSelectGameScreen() {
        let vc = SelectGameFirstViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

extension SettinfGameViewController {
    private func setupViews() {
        view.backgroundColor = .background
        view.addSubview(returnButton)
        view.addSubview(gameTimeView)
        view.addSubview(items)
        returnButton.addTarget(self, action: #selector(returnToSelectGameScreen), for: .touchUpInside)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            returnButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            returnButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            returnButton.widthAnchor.constraint(equalToConstant: 30),
            returnButton.heightAnchor.constraint(equalToConstant: 22),
            
            gameTimeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 118),
            gameTimeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            gameTimeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            gameTimeView.heightAnchor.constraint(equalToConstant: 339),
            
            items.topAnchor.constraint(equalTo: gameTimeView.bottomAnchor, constant: 40),
            items.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            items.heightAnchor.constraint(equalToConstant: 152),
            items.widthAnchor.constraint(equalToConstant: 150)
            
        ])
    }
}


