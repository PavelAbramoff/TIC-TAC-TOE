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
    
    // MARK: - UI Properties
//    private let backIcon: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = .backIcon
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
    private lazy var returnButton = ReturnButton(type: .system)
    
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
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
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
    
    @objc func returnToSelectGameScreen() {
        let vc = SelectGameFirstViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .background
        view.addSubview(returnButton)
        view.addSubview(youCell)
        view.addSubview(oskin)
        view.addSubview(youLabel)
        view.addSubview(player2Cell)
        view.addSubview(xskin)
        view.addSubview(player2Label)
        view.addSubview(turnLabel)
        view.addSubview(stackBackground)
        view.addSubview(squareStackView)
        returnButton.addTarget(self, action: #selector(returnToSelectGameScreen), for: .touchUpInside)
    }
}
// MARK: - Setup Constraints
private extension GameScreen1ViewController {
     func setupConstraints() {
        NSLayoutConstraint.activate([
//            backIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
//            backIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            backIcon.widthAnchor.constraint(equalToConstant: 30),
//            backIcon.heightAnchor.constraint(equalToConstant: 22),
            
            returnButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            returnButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            returnButton.widthAnchor.constraint(equalToConstant: 30),
            returnButton.heightAnchor.constraint(equalToConstant: 22),
            
            youCell.topAnchor.constraint(equalTo: returnButton.bottomAnchor, constant: 20),
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
