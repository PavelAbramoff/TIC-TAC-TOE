//
//  HowToPlayViewController.swift
//  TIC-TAC-TOE
//
//  Created by Кирилл Бахаровский on 10/3/24.
//

import UIKit

class HowToPlayViewController: UIViewController {
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "How to play"
        label.textAlignment = .center
        label.font = UIFont.customBoldFont(size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.background
        
        createStackView()
        setupViews()
        setConstraints()
    }
    
    @objc func backButtonTapped() {
        self.backButton.setImage(UIImage(named: "backButtonTapped"), for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.backButton.setImage(UIImage(named: "backButton"), for: .normal)
        }
        
        dismiss(animated: true)
    }
    
    
    private func createStackView() {
        let step1 = createStep(number: 1, text: "Draw a grid with three rows and three columns, creating nine squares in total.")
        let step2 = createStep(number: 2, text: "Players take turns placing their marker (X or O) in an empty square. To make a move, a player selects a number corresponding to the square where they want to place their marker.")
        let step3 = createStep(number: 3, text: "Player X starts by choosing a square (e.g., square 5). \nPlayer O follows by choosing an empty square (e.g., square 1). \nContinue alternating turns until the game ends.")
        let step4 = createStep(number: 4, text: "The first player to align three of their markers horizontally, vertically, or diagonally wins. Examples of Winning \nCombinations: \nHorizontal: Squares 1, 2, 3 or 4, 5, 6 or 7, 8, 9 \nVertical: Squares 1, 4, 7 or 2, 5, 8 or 3, 6, 9 \nDiagonal: Squares 1, 5, 9 or 3, 5, 7")
        
        stackView.addArrangedSubview(step1)
        stackView.addArrangedSubview(step2)
        stackView.addArrangedSubview(step3)
        stackView.addArrangedSubview(step4)
    }
    
    private func createStep(number: Int, text: String) -> UIStackView {
        let stepStackView = UIStackView()
        stepStackView.axis = .horizontal
        stepStackView.alignment = .top
        stepStackView.spacing = 20
        
        let numberLabel = UILabel()
        numberLabel.text = "\(number)"
        numberLabel.textAlignment = .center
        numberLabel.font = UIFont.customRegularFont(size: 18)
        numberLabel.backgroundColor = UIColor.purple
        numberLabel.textColor = UIColor.black
        numberLabel.layer.cornerRadius = 45/2
        numberLabel.layer.masksToBounds = true
        numberLabel.widthAnchor.constraint(equalToConstant: 45).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        let containerView = UIView()
        containerView.layer.cornerRadius = 30
        containerView.backgroundColor = UIColor.lightBlue
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let textLabel = UILabel()
        textLabel.text = text
        textLabel.numberOfLines = 0
        textLabel.font = UIFont.customRegularFont(size: 18)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            textLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            textLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            textLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12)
        ])
        
        stepStackView.addArrangedSubview(numberLabel)
        stepStackView.addArrangedSubview(containerView)
        
        return stepStackView
    }
    
}

extension HowToPlayViewController {
    
    private func setupViews() {
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 26),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 22)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
    }
}

