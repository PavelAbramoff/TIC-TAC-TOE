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
    private let backIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .backIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.addSubview(backIcon)
    }
}
// MARK: - Setup Constraints
    private extension GameScreen1ViewController {
     func setupConstraints() {
        NSLayoutConstraint.activate([
            backIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),  // Отступ от верхнего края
                        backIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),  // Отступ от левого края
            backIcon.heightAnchor.constraint(equalToConstant: offset),
            backIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
            }
}
