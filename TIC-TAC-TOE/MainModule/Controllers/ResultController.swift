//
//  ResultController.swift
//  TIC-TAC-TOE
//
//  Created by Daria Arisova on 04.10.2024.
//

import UIKit

class ResultController: UIViewController {
    struct Result {
        let image: UIImage
        let text: String
        
        init(image: UIImage, text: String) {
          self.image = image
          self.text = text
        }
    }
    
    let resultList = [
        "win": Result(image: #imageLiteral(resourceName: "Win-Icon"), text: "Player One win!"),
        "draw": Result(image: #imageLiteral(resourceName: "Draw-Icon"), text: "Draw!"),
        "lose": Result(image: #imageLiteral(resourceName: "Lose-Icon"), text: "You Lose!")
    ] as [String: Result]
    var resultId = "win" // TODO
    
    // MARK: - UI
    
    let resultStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .background
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let btnStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .background
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
//        label.text = resultLabels["win"]!
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.customBoldFont(size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let resultIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
//        imageView.image = UIImage(named: "Lose-Icon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var playAgainBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Play again", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blue.cgColor
        button.tintColor = .background
        button.titleLabel?.font = UIFont.customBoldFont(size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(btnPlayAgainTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var backBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.backgroundColor = .background
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blue.cgColor
        button.tintColor = .blue
        button.titleLabel?.font = UIFont.customBoldFont(size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(btnBackTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func btnPlayAgainTapped() {
        // TODO
        self.backBtn.backgroundColor = .background
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.backBtn.backgroundColor = .blue
        }
    }
    
    @objc func btnBackTapped() {
        self.backBtn.backgroundColor = .blue
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.backBtn.backgroundColor = .background
        }
        
        let vc = SelectGameFirstViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        setConstraints()
    }
}

// MARK: - Set Views and Set Constraints

extension ResultController {
    private func setViews() {
        view.backgroundColor = .background
        view.addSubview(resultStackView)
        resultStackView.addArrangedSubview(resultLabel)
        resultLabel.text = resultList[resultId]?.text
        resultStackView.addArrangedSubview(resultIcon)
        resultIcon.image = resultList[resultId]?.image
        view.addSubview(btnStackView)
        btnStackView.addArrangedSubview(playAgainBtn)
        btnStackView.addArrangedSubview(backBtn)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            resultStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            resultStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            resultStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            resultStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            btnStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            btnStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnStackView.heightAnchor.constraint(equalToConstant: 156),
            btnStackView.widthAnchor.constraint(equalToConstant: 348),
            
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            resultIcon.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20),
            resultIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultIcon.heightAnchor.constraint(equalToConstant: 228),
            resultIcon.widthAnchor.constraint(equalToConstant: 228),
            
            backBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backBtn.heightAnchor.constraint(equalToConstant: 72),
            backBtn.widthAnchor.constraint(equalToConstant: 348),
            
            playAgainBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playAgainBtn.heightAnchor.constraint(equalToConstant: 72),
            playAgainBtn.widthAnchor.constraint(equalToConstant: 348),
        ])
    }
}
