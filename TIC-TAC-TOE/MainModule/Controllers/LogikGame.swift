//
//  LogikGame.swift
//  TIC-TAC-TOE
//
//  Created by apple on 10/6/24.
//
import UIKit

class LogikGame: UIViewController {
    
    // Массив для хранения состояния игрового поля (0 - пусто, 1 - крестик, 2 - нолик)
    var board = [Int](repeating: 0, count: 9)
    
    // Индекс текущего игрока (1 - крестик, 2 - нолик)
    var currentPlayer = 1
    
    // Массив кнопок для игрового поля
    var buttons: [UIButton] = []
    
    // Победные комбинации
    let winningCombinations = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],  // Горизонтальные линии
        [0, 3, 6], [1, 4, 7], [2, 5, 8],  // Вертикальные линии
        [0, 4, 8], [2, 4, 6]              // Диагональные линии
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupBoard()
    }
    
    // Создаем игровое поле
    func setupBoard() {
        let gridSize: CGFloat = 100
        let spacing: CGFloat = 10
        
        for i in 0..<9 {
            let button = UIButton(type: .system)
            button.tag = i // Индекс кнопки
           
            button.frame = CGRect(
                x: CGFloat(i % 3) * (gridSize + spacing),
                y: CGFloat(i / 3) * (gridSize + spacing),
                width: gridSize,
                height: gridSize
            )
            button.setTitle("", for: .normal)
            button.setBackgroundImage(UIImage(named: "empty"), for: .normal) // Пустая клетка
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)
            buttons.append(button)
        }
        
        // Устанавливаем автолейаут для кнопок
        for (index, button) in buttons.enumerated() {
            
            button.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: gridSize),
                button.heightAnchor.constraint(equalToConstant: gridSize),
                button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(index % 3) * (gridSize + spacing)),
                button.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(index / 3) * (gridSize + spacing))
            ])
        }
    }
    
    // Обработка нажатия на кнопку
    @objc func buttonTapped(_ sender: UIButton) {
        let index = sender.tag
        
        // Проверяем, что клетка пуста
        if board[index] == 0 {
            // Заполняем клетку в зависимости от текущего игрока
            if currentPlayer == 1 {
                sender.setBackgroundImage(UIImage(named: "Xskin1"), for: .normal)
                board[index] = 1
            } else {
                sender.setBackgroundImage(UIImage(named: "Oskin1"), for: .normal)
                board[index] = 2
            }
            
            // Проверяем, есть ли победитель
            if let winner = checkForWinner() {
                showWinnerAlert(winner: winner)
            } else if board.allSatisfy({ $0 != 0 }) {
                // Если все клетки заполнены, и нет победителя — ничья
                showWinnerAlert(winner: 0)
            }
            
            // Переключаем игрока
            currentPlayer = currentPlayer == 1 ? 2 : 1
        }
    }
    
    // Проверяем, есть ли победитель
    func checkForWinner() -> Int? {
        for combination in winningCombinations {
            let (a, b, c) = (board[combination[0]], board[combination[1]], board[combination[2]])
            if a != 0 && a == b && b == c {
                return a // Возвращаем победителя (1 - крестик, 2 - нолик)
            }
        }
        return nil
    }
    
    // Показываем алерт с результатом игры
    func showWinnerAlert(winner: Int) {
        var message: String
        if winner == 0 {
            message = "Ничья!"
        } else {
            message = winner == 1 ? "Крестики победили!" : "Нолики победили!"
        }
        
        let alert = UIAlertController(title: "Игра окончена", message: message, preferredStyle: .alert)


let resetAction = UIAlertAction(title: "Играть снова", style: .default) { _ in
            self.resetGame()
        }
        alert.addAction(resetAction)
        present(alert, animated: true, completion: nil)
    }
    
    // Сбрасываем игру
    func resetGame() {
        board = [Int](repeating: 0, count: 9)
        currentPlayer = 1
        
        for button in buttons {
            button.setBackgroundImage(UIImage(named: "empty"), for: .normal)
        }
    }
}

