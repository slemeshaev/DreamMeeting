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
    
    static func registerUser(withCredentials credentials: AuthCredentials, completion: @escaping((Error?) -> Void)) {
        NetworkService.uploadImage(image: credentials.profileImage) { imageUrl in
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { (result, error) in
                if let error = error {
                    print("DEBUG: Error uploading image \(error.localizedDescription)")
                    return
                }
                
                guard let uid = result?.user.uid else { return }
                
                let data = ["uid": uid,
                            "imageUrl": imageUrl,
                            "email": credentials.email,
                            "fullname": credentials.fullName,
                            "age": 18] as [String: Any]
                
                Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
            }
        }
    }
}

