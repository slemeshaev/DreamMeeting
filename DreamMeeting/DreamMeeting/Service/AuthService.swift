//
//  AuthService.swift
//  DreamMeeting
//
//  Created by Станислав Лемешаев on 10.03.2021.
//

import UIKit
import Firebase

struct AuthCredentials {
    let profileImage: UIImage
    let email: String
    let password: String
    let fullName: String
}

struct AuthService {
    
    static func registerUser(withCredentials credentials: AuthCredentials) {
        print("DEBUG: Register user with firebase here...")
    }
}

