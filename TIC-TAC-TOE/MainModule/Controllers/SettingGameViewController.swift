//
//  SettinfGameViewController.swift
//  UIKit- components
//
//  Created by apple on 9/30/24.
//

import UIKit

class SettingGameViewController: UIViewController {
    
    private lazy var returnButton = ReturnButton(type: .system)
    
    private let gameTimeView = SettingGameView()
    
    private let containerView = UIView()
    
    private let scrollView = UIScrollView()
    
    private let items = ChangeItems()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    @objc func returnToSelectGameScreen() {
        dismiss(animated: true)
    }
}

extension SettingGameViewController {
    private func setupViews() {
        view.backgroundColor = .background
        view.addSubview(returnButton)
        view.addSubview(gameTimeView)
        view.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(items)
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
            
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 460),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 600),
            
            scrollView.topAnchor.constraint(equalTo: containerView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                    
            items.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 35),
            items.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 33),
            items.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -33),
            items.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            items.heightAnchor.constraint(equalToConstant: 900)
            
        ])
    }
}


