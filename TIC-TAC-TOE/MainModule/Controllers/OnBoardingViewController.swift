//
//  ViewController.swift
//  TIC-TAC-TOE
//
//  Created by apple on 9/29/24.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    private let mainlogoView = LogoView()
    private var leftBarButtonItem = UIBarButtonItem()
    private var rightBarButtonItem = UIBarButtonItem()
    
    private lazy var rulesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "rulesButtonImage"), for: .normal)
        button.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "settingsButtonImage"), for: .normal)
        button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Let's play", for: .normal)
        button.titleLabel?.font = UIFont.customBoldFont(size: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.background
        setupViews()
        setConstraints()
        
    }
    
    @objc func rulesButtonTapped() {
        self.rulesButton.setImage(UIImage(named: "rulesButtonImageTapped"), for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.rulesButton.setImage(UIImage(named: "rulesButtonImage"), for: .normal)
        }
        
        print(rulesButtonTapped)
        let vc = HowToPlayViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
    @objc func settingsButtonTapped() {
        self.settingsButton.setImage(UIImage(named: "settingsButtonImageTapped"), for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.settingsButton.setImage(UIImage(named: "settingsButtonImage"), for: .normal)
        }
        
        print(settingsButtonTapped)
        let vc = SettingGameViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc func playButtonTapped() {
        self.playButton.backgroundColor = UIColor.lightBlue
        self.playButton.setTitleColor(UIColor.black, for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.playButton.backgroundColor = UIColor.blue
            self.playButton.setTitleColor(UIColor.white, for: .normal)
        }
        
        let vc = SelectGameFirstViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

// MARK: - SetupViews and Constraints
extension OnBoardingViewController {
    
    private func setupViews(){
        mainlogoView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainlogoView)
        view.addSubview(playButton)
        view.addSubview(rulesButton)
        view.addSubview(settingsButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainlogoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainlogoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height / 4)
        ])
        
        NSLayoutConstraint.activate([
            playButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            playButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            playButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -46),
            playButton.heightAnchor.constraint(equalToConstant: 72)
        ])
        
        NSLayoutConstraint.activate([
            rulesButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            rulesButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            rulesButton.widthAnchor.constraint(equalToConstant: 36),
            rulesButton.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        NSLayoutConstraint.activate([
            settingsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            settingsButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            settingsButton.widthAnchor.constraint(equalToConstant: 38),
            settingsButton.heightAnchor.constraint(equalToConstant: 36)
        ])
        
    }
}

