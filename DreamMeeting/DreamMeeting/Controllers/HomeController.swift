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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(topStackView)
        topStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                            left: view.leftAnchor, right: view.rightAnchor)
    }
    
}
