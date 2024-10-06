//
//  GameScreen1ViewController.swift
//  TIC-TAC-TOE
//
//  Created by Andrew Linkov on 01.10.2024.
//

import Foundation
import UIKit

final class GameScreen1ViewController: UIViewController {
    
    //MARK: - Dependencies
    let fontSize: CGFloat = 20
    let offset: CGFloat = 60
    let smallButtonSize: CGFloat = 40
    private var timer: Timer?
    private var totalSeconds: Int = 0
    
    // MARK: - UI Properties
    private let backIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .backIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let youCell: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .cell
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let oskin: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .oskin1
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let youLabel: UILabel = {
        let imageView = UILabel()
        imageView.text = "You"
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let centerSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textAlignment = .center
        label.font = UIFont.customBoldFont(size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let player2Cell: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .cell
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let xskin: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .xskin1
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let player2Label: UILabel = {
        let imageView = UILabel()
        imageView.text = "Player Two"
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let turnLabel: UILabel = {
        let label = UILabel()
        label.text = "Your turn"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    private let stackBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .blue 
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let squareStackView: UIStackView = {
        func createRow() -> UIStackView {
            var squares = [UIImageView]()
            for _ in 1...3 {
                let square = UIImageView()
                square.image = .cell
                square.translatesAutoresizingMaskIntoConstraints = false
                square.contentMode = .scaleAspectFit
                square.widthAnchor.constraint(equalToConstant: 74).isActive = true
                square.heightAnchor.constraint(equalToConstant: 74).isActive = true
                squares.append(square)
            }
            
            let rowStack = UIStackView(arrangedSubviews: squares)
            rowStack.axis = .horizontal
            rowStack.spacing = 10
            rowStack.alignment = .center
            rowStack.distribution = .equalSpacing
            return rowStack
        }
        
        // Создаем три ряда ячеек
        let stackView = UIStackView(arrangedSubviews: [createRow(), createRow(), createRow()])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        startTimer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getTimeDuration()
        timerLabel.text = formatTime(seconds: totalSeconds)
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = UIColor.lightGray
        view.addSubview(backIcon)
        view.addSubview(youCell)
        view.addSubview(oskin)
        view.addSubview(youLabel)
        view.addSubview(centerSeparatorView)
        centerSeparatorView.addSubview(timerLabel)
        view.addSubview(player2Cell)
        view.addSubview(xskin)
        view.addSubview(player2Label)
        view.addSubview(turnLabel)
        view.addSubview(stackBackground)
        view.addSubview(squareStackView)
    }
}

// MARK: - Timer
extension GameScreen1ViewController {
    private func getTimeDuration() {
        guard let gameTimeDuration = UserDefaults.standard.object(forKey: "GameTimeDuration") as? Int else {
            totalSeconds = 30
            return
        }
        //totalSeconds = gameTimeDuration
        totalSeconds = 10
    }
    
    private func startTimer() {
           timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
       }
    
       @objc private func updateTimer() {
           if totalSeconds > 0 {
               totalSeconds -= 1
               timerLabel.text = formatTime(seconds: totalSeconds)
               
           } else {
               timer?.invalidate() // Остановка таймера по истечению времени
               timer = nil
           }
       }
       
       private func formatTime(seconds: Int) -> String {
           let minutes = seconds / 60
           let remainingSeconds = seconds % 60
           return String(format: "%02d:%02d", minutes, remainingSeconds)
       }
}

// MARK: - Setup Constraints
private extension GameScreen1ViewController {
     func setupConstraints() {
        NSLayoutConstraint.activate([
            backIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            backIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backIcon.widthAnchor.constraint(equalToConstant: 30),
            backIcon.heightAnchor.constraint(equalToConstant: 22),
            
            youCell.topAnchor.constraint(equalTo: backIcon.bottomAnchor, constant: 20),
            youCell.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            youCell.widthAnchor.constraint(equalToConstant: 103),
            youCell.heightAnchor.constraint(equalToConstant: 103),
            
            oskin.topAnchor.constraint(equalTo: youCell.topAnchor, constant: 10),
            oskin.leadingAnchor.constraint(equalTo: youCell.leadingAnchor, constant: 24),
            oskin.widthAnchor.constraint(equalToConstant: 54),
            oskin.heightAnchor.constraint(equalToConstant: 54),
           
            youLabel.topAnchor.constraint(equalTo: oskin.bottomAnchor, constant: 10),
            youLabel.centerXAnchor.constraint(equalTo: oskin.centerXAnchor),
            youLabel.widthAnchor.constraint(equalToConstant: 83),
            youLabel.heightAnchor.constraint(equalToConstant: 20),
            
            centerSeparatorView.topAnchor.constraint(equalTo: youCell.topAnchor),
            centerSeparatorView.leadingAnchor.constraint(equalTo: youCell.trailingAnchor, constant: 10),
            centerSeparatorView.trailingAnchor.constraint(equalTo: player2Cell.leadingAnchor, constant: -10),
            centerSeparatorView.bottomAnchor.constraint(equalTo: youCell.bottomAnchor),
            
            timerLabel.centerXAnchor.constraint(equalTo: centerSeparatorView.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: centerSeparatorView.centerYAnchor),
            
            player2Cell.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 58),
            player2Cell.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 265),
            player2Cell.widthAnchor.constraint(equalToConstant: 103),
            player2Cell.heightAnchor.constraint(equalToConstant: 103),
            
            xskin.topAnchor.constraint(equalTo: player2Cell.topAnchor, constant: 10),
            xskin.leadingAnchor.constraint(equalTo: player2Cell.leadingAnchor, constant: 24),
            xskin.widthAnchor.constraint(equalToConstant: 54),
            xskin.heightAnchor.constraint(equalToConstant: 54),
            
            player2Label.topAnchor.constraint(equalTo: xskin.bottomAnchor, constant: 10),
            player2Label.leadingAnchor.constraint(equalTo: player2Cell.leadingAnchor, constant: 10),
            player2Label.widthAnchor.constraint(equalToConstant: 83),
            player2Label.heightAnchor.constraint(equalToConstant: 20),
            
            turnLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 215),
            turnLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            turnLabel.widthAnchor.constraint(equalToConstant: 94),
            turnLabel.heightAnchor.constraint(equalToConstant: 24),
            
            stackBackground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 315),
            stackBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackBackground.widthAnchor.constraint(equalToConstant: 300),
            stackBackground.heightAnchor.constraint(equalToConstant: 300),
                        
            squareStackView.centerXAnchor.constraint(equalTo: stackBackground.centerXAnchor),
            squareStackView.centerYAnchor.constraint(equalTo: stackBackground.centerYAnchor)
        ])
     }
}
