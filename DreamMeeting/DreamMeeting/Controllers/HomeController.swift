//
//  HomeController.swift
//  DreamMeeting
//
//  Created by Станислав Лемешаев on 24.01.2021.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    private let topStackView = HomeNavigationStackView()
    private let bottomStack = BottomControlsStackView()
    
    private let deckView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 5
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureCards()
    }
    
    // MARK: - Helpers
    // конфигурация карточек
    func configureCards() {
        let cardView1 = CardView()
        let cardView2 = CardView()
        
        deckView.addSubview(cardView1)
        deckView.addSubview(cardView2)
        
        cardView1.fillSuperview()
        cardView2.fillSuperview()
    }
    
    // конфигурация UI
    func configureUI() {
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [topStackView, deckView, bottomStack])
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,
                            bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
        stackView.bringSubviewToFront(deckView)
    }
    
}
