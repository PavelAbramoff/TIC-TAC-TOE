//
//  SelectGameFirstViewController.swift
//  TIC-TAC-TOE
//
//  Created by Кирилл Бахаровский on 10/3/24.
//

import UIKit

class SelectGameFirstViewController: UIViewController {
    
    private let selectGameView = SelectGame()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "settingsButtonImage"), for: .normal)
        button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.background
        
        setupViews()
        setConstraints()
        setupButtonTargets()
    }
    
    @objc func settingsButtonTapped() {
        self.settingsButton.setImage(UIImage(named: "settingsButtonImageTapped"), for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.settingsButton.setImage(UIImage(named: "settingsButtonImage"), for: .normal)
        }
        
        print(settingsButtonTapped)
        let vc = SettinfGameViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc func singlePlayerButtonTapped() {
        updateColorButtons(sender: selectGameView.singlePlayerButton)
        
        print("singlePlayerButtonTapped")
        
        let vc = GameScreen1ViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc func twoPlayersButtonTapped() {
        updateColorButtons(sender: selectGameView.twoPlayersButton)
        print("twoPlayersButtonTapped")
        
        let vc = GameScreen1ViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    private func setupButtonTargets() {
        selectGameView.singlePlayerButton.addTarget(self, action: #selector(singlePlayerButtonTapped), for: .touchUpInside)
        selectGameView.twoPlayersButton.addTarget(self, action: #selector(twoPlayersButtonTapped), for: .touchUpInside)
    }
    
    private func updateColorButtons(sender: UIButton) {
        
        sender.backgroundColor = UIColor.blue
        sender.configuration?.baseForegroundColor = UIColor.white
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.backgroundColor =  UIColor.lightBlue
            sender.configuration?.baseForegroundColor = UIColor.black
        }
    }
}

extension SelectGameFirstViewController {
    
    private func setupViews(){
        selectGameView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(selectGameView)
        view.addSubview(settingsButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            selectGameView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectGameView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            settingsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            settingsButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            settingsButton.widthAnchor.constraint(equalToConstant: 38),
            settingsButton.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
}
