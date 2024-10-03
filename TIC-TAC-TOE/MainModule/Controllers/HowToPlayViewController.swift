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
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .pink
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
        contentView.backgroundColor = .yellow
    }
    
    func prepareScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // ScrollView Constraints
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        // contentView Constraints
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            ])
    }
    
    
    func configureLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "How To Play"
        
    }
    
    func configureTopView () {
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .cyan
    }
    
    func configureBackButton() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(named: "Back-Icon"), for: .normal)
    }
    
    func configureStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.backgroundColor = .tintColor
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
        
//        contentView.addSubview(stackView)
//        
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: topView.bottomAnchor),
//            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
//            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
    }
}
