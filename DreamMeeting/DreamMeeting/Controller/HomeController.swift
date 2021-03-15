//
//  HomeController.swift
//  DreamMeeting
//
//  Created by Станислав Лемешаев on 24.01.2021.
//

import UIKit
import Firebase

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
        checkIfUserIsLoggedIn()
        logout()
    }
    
    // MARK: - API
    
    private func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser == nil {
            print("DEBUG: User not logged in...")
        } else {
            print("DEBUG: User is logged in...")
        }
    }
    
    private func logout() {
        do {
            try Auth.auth().signOut()
            print("DEBUG: Present login controller here")
        } catch {
            print("DEBUG: Failed to sign out...")
        }
    }
    
    // MARK: - Helpers
    
    private func configureCards() {
        let user1 = User(name: "Jane Doe", age: 22, images: [#imageLiteral(resourceName: "JadeWeber2"), #imageLiteral(resourceName: "lady4c")])
        let user2 = User(name: "Megan", age: 21, images: [#imageLiteral(resourceName: "kelly3"),#imageLiteral(resourceName: "kelly2")])
        
        let cardView1 = CardView(viewModel: CardViewModel(user: user1))
        let cardView2 = CardView(viewModel: CardViewModel(user: user2))
        
        
        deckView.addSubview(cardView1)
        deckView.addSubview(cardView2)
        
        cardView1.fillSuperview()
        cardView2.fillSuperview()
    }
    
    private func configureUI() {
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
