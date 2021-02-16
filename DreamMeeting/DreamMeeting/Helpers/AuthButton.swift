//
//  AuthButton.swift
//  DreamMeeting
//
//  Created by Станислав Лемешаев on 16.02.2021.
//

import UIKit

class AuthButton: UIButton {
    
    init(title: String, type: ButtonType) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
