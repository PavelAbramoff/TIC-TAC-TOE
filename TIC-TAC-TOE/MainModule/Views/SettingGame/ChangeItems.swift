//
//  ChangeItems.swift
//  UIKit- components
//
//  Created by apple on 10/3/24.
//

import UIKit

class ChangeItems: UIView {
    private let defaults = UserDefaults.standard
      var gameCoverTypeIndex = 0
      
      struct CoverIcons {
          let firstImage: UIImage
          let secondImage: UIImage
          
          init(firstImage: UIImage, secondImage: UIImage) {
              self.firstImage = firstImage
              self.secondImage = secondImage
          }
      }

      let coversIconsList = [
          ["Xskin1", "Oskin1"],
          ["Xskin4", "Oskin4"],
          ["Xskin3", "Oskin3"],
          ["Xskin5", "Oskin5"],
          ["Xskin6", "Oskin6"],
          ["Isolation_Mode", "Oskin-potato"]
      ]
      
      // MARK: First Item

    
    var buttons: [UIButton] = []
    
    private let firstbackView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.addShadowOnView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let crossImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Xskin1")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let zer0ImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Oskin1")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let button = BigButton(tag: 0)
    
    // MARK: Second Item
    
    private let backViewSecondItem: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.addShadowOnView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let crossImageViewSecondItem: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Xskin4")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let zer0ImageViewSecondItem: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Oskin4")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let buttonSecondItem = BigButton(tag: 1)
    
    // MARK: Third Item
    
    private let backViewThirdItem: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.addShadowOnView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let crossImageViewThirdItem: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Xskin3")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let zer0ImageViewThirdItem: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Oskin3")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let buttonThirdItem = BigButton(tag: 2)
    
    // MARK: For Item
    
    private let backViewForItem: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.addShadowOnView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let crossImageViewForItem: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Xskin5")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let zeroImageViewForItem: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Oskin5")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let buttonForItem = BigButton(tag: 3)
    
    // MARK: Five Item
    
    private let backViewFiveItem: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.addShadowOnView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let crossImageViewFiveItem: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Xskin6")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let zeroImageViewFiveItem: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Oskin6")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let buttonFiveItem = BigButton(tag: 4)
    
    // MARK: Six Item
    
    private let backViewSixItem: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.addShadowOnView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let crossImageViewSixItem: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Isolation_Mode")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let zeroImageViewSixItem: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Oskin-potato")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let buttonSixItem = BigButton(tag: 5)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
        
        if let myValue = defaults.object(forKey: "GameCoverTypeIndex") {
              gameCoverTypeIndex = myValue as! Int
              
              print("gameCoverTypeIndex \(gameCoverTypeIndex)")
          }
          
        addButtonInArray()
        setCover(index: gameCoverTypeIndex)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addButtonInArray() {
        buttons.append(button)
        buttons.append(buttonSecondItem)
        buttons.append(buttonThirdItem)
        buttons.append(buttonForItem)
        buttons.append(buttonFiveItem)
        buttons.append(buttonSixItem)
    }
    
    private func setupView() {
        
        addSubview(firstbackView)
        addSubview(crossImageView)
        addSubview(zer0ImageView)
        addSubview(button)
        
        addSubview(backViewSecondItem)
        addSubview(crossImageViewSecondItem)
        addSubview(zer0ImageViewSecondItem)
        addSubview(buttonSecondItem)
        
        addSubview(backViewThirdItem)
        addSubview(crossImageViewThirdItem)
        addSubview(zer0ImageViewThirdItem)
        addSubview(buttonThirdItem)
        
        addSubview(backViewForItem)
        addSubview(crossImageViewForItem)
        addSubview(zeroImageViewForItem)
        addSubview(buttonForItem)
        
        addSubview(backViewFiveItem)
        addSubview(crossImageViewFiveItem)
        addSubview(zeroImageViewFiveItem)
        addSubview(buttonFiveItem)
        
        addSubview(backViewSixItem)
        addSubview(crossImageViewSixItem)
        addSubview(zeroImageViewSixItem)
        addSubview(buttonSixItem)
        
        for btn in buttons {
            btn.isEnabled = true
//            btn.addTarget(self, action: #selector(selectNewCover), for: .touchUpInside)
        }
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func selectNewCover(btn: UIButton) {
        let index = btn.tag
        
        setCover(index: index)
    }
    
    func setCover(index: Int) {
        let coverType = coversIconsList[index]
        
        print("cover \(coverType) \(coverType[0]) \(coverType[1])")
    
        defaults.set(index, forKey: "GameCoverTypeIndex")
//        defaults.set(coverType, forKey: "GameCoverIcons")
        defaults.set(coverType[0], forKey: "GameCoverFirstIcon")
        defaults.set(coverType[1], forKey: "GameCoverSecondIcon")
        
        for btnEl in buttons {
            if btnEl.tag == index {
                btnEl.setTitle("Picked", for: .normal)
                btnEl.backgroundColor = .blue
                btnEl.tintColor = .white
            } else {
                btnEl.setTitle("Choose", for: .normal)
                btnEl.backgroundColor = .background
                btnEl.tintColor = .black
            }
        }
    }
}

extension ChangeItems {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            self.heightAnchor.constraint(equalToConstant: 900),
            self.widthAnchor.constraint(equalToConstant: 324),
            
            firstbackView.topAnchor.constraint(equalTo: self.topAnchor),
            firstbackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            firstbackView.heightAnchor.constraint(equalToConstant: 150),
            firstbackView.widthAnchor.constraint(equalToConstant: 152),
            
            crossImageView.topAnchor.constraint(equalTo: firstbackView.topAnchor, constant: 20),
            crossImageView.leadingAnchor.constraint(equalTo: firstbackView.leadingAnchor,constant: 20),
            crossImageView.heightAnchor.constraint(equalToConstant: 54),
            crossImageView.widthAnchor.constraint(equalToConstant: 53),
            
            zer0ImageView.topAnchor.constraint(equalTo: firstbackView.topAnchor, constant: 20),
            zer0ImageView.trailingAnchor.constraint(equalTo: firstbackView.trailingAnchor, constant: -20),
            zer0ImageView.heightAnchor.constraint(equalToConstant: 54),
            zer0ImageView.widthAnchor.constraint(equalToConstant: 53),
            
            button.topAnchor.constraint(equalTo: crossImageView.bottomAnchor, constant: 18),
            button.heightAnchor.constraint(equalToConstant: 39),
            button.centerXAnchor.constraint(equalTo: firstbackView.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 112),
            
            // MARK: SeconsItems
            backViewSecondItem.topAnchor.constraint(equalTo: self.topAnchor),
            backViewSecondItem.trailingAnchor.constraint(equalTo: self.trailingAnchor ),
            backViewSecondItem.heightAnchor.constraint(equalToConstant: 150),
            backViewSecondItem.widthAnchor.constraint(equalToConstant: 152),
            
            crossImageViewSecondItem.topAnchor.constraint(equalTo: backViewSecondItem.topAnchor, constant: 20),
            crossImageViewSecondItem.leadingAnchor.constraint(equalTo: backViewSecondItem.leadingAnchor,constant: 20),
            crossImageViewSecondItem.heightAnchor.constraint(equalToConstant: 54),
            crossImageViewSecondItem.widthAnchor.constraint(equalToConstant: 53),
            
            zer0ImageViewSecondItem.topAnchor.constraint(equalTo: backViewSecondItem.topAnchor, constant: 20),
            zer0ImageViewSecondItem.trailingAnchor.constraint(equalTo: backViewSecondItem.trailingAnchor, constant: -20),
            zer0ImageViewSecondItem.heightAnchor.constraint(equalToConstant: 54),
            zer0ImageViewSecondItem.widthAnchor.constraint(equalToConstant: 53),
            
            buttonSecondItem.topAnchor.constraint(equalTo: zer0ImageViewSecondItem.bottomAnchor, constant: 18),
            buttonSecondItem.heightAnchor.constraint(equalToConstant: 39),
            buttonSecondItem.centerXAnchor.constraint(equalTo: backViewSecondItem.centerXAnchor),
            buttonSecondItem.widthAnchor.constraint(equalToConstant: 112),
            
            // MARK: ThirdItem
            
            backViewThirdItem.topAnchor.constraint(equalTo: firstbackView.bottomAnchor, constant: 20),
            backViewThirdItem.leadingAnchor.constraint(equalTo: self.leadingAnchor ),
            backViewThirdItem.heightAnchor.constraint(equalToConstant: 150),
            backViewThirdItem.widthAnchor.constraint(equalToConstant: 152),
            
            crossImageViewThirdItem.topAnchor.constraint(equalTo: backViewThirdItem.topAnchor, constant: 20),
            crossImageViewThirdItem.leadingAnchor.constraint(equalTo: backViewThirdItem.leadingAnchor,constant: 20),
            crossImageViewThirdItem.heightAnchor.constraint(equalToConstant: 54),
            crossImageViewThirdItem.widthAnchor.constraint(equalToConstant: 53),
            
            zer0ImageViewThirdItem.topAnchor.constraint(equalTo: backViewThirdItem.topAnchor, constant: 20),
            zer0ImageViewThirdItem.trailingAnchor.constraint(equalTo: backViewThirdItem.trailingAnchor, constant: -20),
            zer0ImageViewThirdItem.heightAnchor.constraint(equalToConstant: 54),
            zer0ImageViewThirdItem.widthAnchor.constraint(equalToConstant: 53),
            
            buttonThirdItem.topAnchor.constraint(equalTo: zer0ImageViewThirdItem.bottomAnchor, constant: 18),
            buttonThirdItem.heightAnchor.constraint(equalToConstant: 39),
            buttonThirdItem.centerXAnchor.constraint(equalTo: backViewThirdItem.centerXAnchor),
            buttonThirdItem.widthAnchor.constraint(equalToConstant: 112),
            
            // MARK: ForItem
            
            backViewForItem.topAnchor.constraint(equalTo: firstbackView.bottomAnchor, constant: 20),
            backViewForItem.trailingAnchor.constraint(equalTo: self.trailingAnchor ),
            backViewForItem.heightAnchor.constraint(equalToConstant: 150),
            backViewForItem.widthAnchor.constraint(equalToConstant: 152),
            
            crossImageViewForItem.topAnchor.constraint(equalTo: backViewForItem.topAnchor, constant: 20),
            crossImageViewForItem.leadingAnchor.constraint(equalTo: backViewForItem.leadingAnchor,constant: 20),
            crossImageViewForItem.heightAnchor.constraint(equalToConstant: 54),
            crossImageViewForItem.widthAnchor.constraint(equalToConstant: 53),
            
            zeroImageViewForItem.topAnchor.constraint(equalTo: backViewForItem.topAnchor, constant: 20),
            zeroImageViewForItem.trailingAnchor.constraint(equalTo: backViewForItem.trailingAnchor, constant: -20),
            zeroImageViewForItem.heightAnchor.constraint(equalToConstant: 54),
            zeroImageViewForItem.widthAnchor.constraint(equalToConstant: 53),
            
            buttonForItem.topAnchor.constraint(equalTo: zeroImageViewForItem.bottomAnchor, constant: 18),
            buttonForItem.heightAnchor.constraint(equalToConstant: 39),
            buttonForItem.centerXAnchor.constraint(equalTo: backViewForItem.centerXAnchor),
            buttonForItem.widthAnchor.constraint(equalToConstant: 112),
            
            // MARK: FiveItem
            
            backViewFiveItem.topAnchor.constraint(equalTo: backViewThirdItem.bottomAnchor, constant: 20),
            backViewFiveItem.leadingAnchor.constraint(equalTo: self.leadingAnchor ),
            backViewFiveItem.heightAnchor.constraint(equalToConstant: 150),
            backViewFiveItem.widthAnchor.constraint(equalToConstant: 152),
            
            crossImageViewFiveItem.topAnchor.constraint(equalTo: backViewFiveItem.topAnchor, constant: 20),
            crossImageViewFiveItem.leadingAnchor.constraint(equalTo: backViewFiveItem.leadingAnchor,constant: 20),
            crossImageViewFiveItem.heightAnchor.constraint(equalToConstant: 54),
            crossImageViewFiveItem.widthAnchor.constraint(equalToConstant: 53),
            
            zeroImageViewFiveItem.topAnchor.constraint(equalTo: backViewFiveItem.topAnchor, constant: 20),
            zeroImageViewFiveItem.trailingAnchor.constraint(equalTo: backViewFiveItem.trailingAnchor, constant: -20),
            zeroImageViewFiveItem.heightAnchor.constraint(equalToConstant: 54),
            zeroImageViewFiveItem.widthAnchor.constraint(equalToConstant: 53),
            
            buttonFiveItem.topAnchor.constraint(equalTo: zeroImageViewFiveItem.bottomAnchor, constant: 18),
            buttonFiveItem.heightAnchor.constraint(equalToConstant: 39),
            buttonFiveItem.centerXAnchor.constraint(equalTo: backViewFiveItem.centerXAnchor),
            buttonFiveItem.widthAnchor.constraint(equalToConstant: 112),
            
            // MARK: Six Item
            
            backViewSixItem.topAnchor.constraint(equalTo: backViewThirdItem.bottomAnchor, constant: 20),
            backViewSixItem.trailingAnchor.constraint(equalTo: self.trailingAnchor ),
            backViewSixItem.heightAnchor.constraint(equalToConstant: 150),
            backViewSixItem.widthAnchor.constraint(equalToConstant: 152),
            
            crossImageViewSixItem.topAnchor.constraint(equalTo: backViewSixItem.topAnchor, constant: 20),
            crossImageViewSixItem.leadingAnchor.constraint(equalTo: backViewSixItem.leadingAnchor,constant: 20),
            crossImageViewSixItem.heightAnchor.constraint(equalToConstant: 54),
            crossImageViewSixItem.widthAnchor.constraint(equalToConstant: 53),
            
            zeroImageViewSixItem.topAnchor.constraint(equalTo: backViewSixItem.topAnchor, constant: 20),
            zeroImageViewSixItem.trailingAnchor.constraint(equalTo: backViewSixItem.trailingAnchor, constant: -20),
            zeroImageViewSixItem.heightAnchor.constraint(equalToConstant: 54),
            zeroImageViewSixItem.widthAnchor.constraint(equalToConstant: 53),
            
            buttonSixItem.topAnchor.constraint(equalTo: zeroImageViewFiveItem.bottomAnchor, constant: 18),
            buttonSixItem.heightAnchor.constraint(equalToConstant: 39),
            buttonSixItem.centerXAnchor.constraint(equalTo: backViewSixItem.centerXAnchor),
            buttonSixItem.widthAnchor.constraint(equalToConstant: 112),
        ])
    }
}
