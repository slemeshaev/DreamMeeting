//
//  CardViewModel.swift
//  DreamMeeting
//
//  Created by Станислав Лемешаев on 03.02.2021.
//

import UIKit

struct CardViewModel {
    
    let user: User
    
    let userInfoText: NSAttributedString
    private var imageIndex = 0
    
    init(user: User) {
        self.user = user
        let attributedText = NSMutableAttributedString(string: user.name,
                                                       attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy),
                                                                    .foregroundColor: UIColor.white])
        attributedText.append(NSAttributedString(string: "  \(user.age)",
                                                 attributes: [.font: UIFont.systemFont(ofSize: 24),
                                                              .foregroundColor: UIColor.white]))
        self.userInfoText = attributedText
    }
    
    func showNextPhoto() {
        print("DEBUG: Show next...")
    }
    
    func showPreviousPhoto() {
        print("DEBUG: Show previos...")
    }
}
