//
//  HowToPlayViewController.swift
//  TIC-TAC-TOE
//
//  Created by Александр Святов on 02.10.2024.
//

import UIKit

class HowToPlayViewController: UIViewController {
    
    //MARK: - Views
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let label = UILabel()
    private let topView = UIView()
    private let backButton = UIButton()
    private let stackView = UIStackView()
    private let howToPlayRules = [
        "Draw a grid with three rows and three columns, creating nine squares in total.",
        "Players take turns placing their marker (X or O) in an empty square.\nTo make a move, a player selects a number corresponding to the square where they want to place their marker.",
        "Player X starts by choosing a square (e.g., square 5).\nPlayer O follows by choosing an empty square (e.g., square 1).\nContinue alternating turns until the game ends.",
        "The first player to align three of their markers horizontally, vertically, or diagonally wins.\nExamples of Winning Combinations:\nHorizontal: Squares 1, 2, 3 or 4, 5, 6 or 7, 8, 9\nVertical: Squares 1, 4, 7 or 2, 5, 8 or 3, 6, 9\nDiagonal: Squares 1, 5, 9 or 3, 5, 7"
    ]
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        setupLayout()
    }
    
    
}

private extension HowToPlayViewController {
    func setupLayout() {
        configureScrollView()
        configureContentView()
        prepareScrollView()
        configureTopView()
        configureBackButton()
        configureLabel()
        configureStackView()
        addContentToScrollView()
    }
    
    func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        
    }
    
    func configureContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func prepareScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // ScrollView Constraints
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            // contentView Constraints
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    @objc func backButtonPressed() {
        self.backButton.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            self.backButton.alpha = 1
        })
        self.dismiss(animated: true)
    }
    
    
    func configureLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "How To Play"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        
    }
    
    func configureTopView () {
        topView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureBackButton() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(named: "Back-Icon"), for: .normal)
        backButton.addTarget(self, action: #selector (backButtonPressed), for: .touchUpInside)
    }
    
    func configureStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
    }
    
    func createMessageView(number: Int, text: String) -> UIStackView {
        let messageView = UIStackView()
        messageView.axis = .horizontal
        messageView.spacing = 10
        messageView.alignment = .top
        
        let numberLabel = UILabel()
        numberLabel.text = "\(number)"
        numberLabel.textAlignment = .center
        numberLabel.backgroundColor = .purple
        numberLabel.textColor = .black
        numberLabel.layer.masksToBounds = true
        numberLabel.layer.cornerRadius = 45/2
        numberLabel.widthAnchor.constraint(equalToConstant: 45).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        let containerView = UIView()
        containerView.layer.cornerRadius = 30
        containerView.backgroundColor = .lightBlue
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        let textLabel = UILabel()
        textLabel.text = text
        textLabel.numberOfLines = 0
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            textLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            textLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            textLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12)
        ])
        
        messageView.addArrangedSubview(numberLabel)
        messageView.addArrangedSubview(containerView)
        
        return messageView
    }
    
    func addContentToScrollView() {
        
        contentView.addSubview(topView)
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        topView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
        ])
        
        topView.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20),
            backButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor)
        ])
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        for i in 0..<howToPlayRules.count {
            stackView.addArrangedSubview(createMessageView(number: i + 1, text: howToPlayRules[i]))
        }
        
    }
}
