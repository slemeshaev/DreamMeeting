//
//  AuthenticationViewModel.swift
//  DreamMeeting
//
//  Created by Станислав Лемешаев on 17.02.2021.
//

import Foundation

protocol AuthenticationViewModel {
    var formIsValid: Bool { get }
}

struct LoginViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
            && password?.isEmpty == false
    }
    
}

struct SignUpViewModel: AuthenticationViewModel {
    var email: String?
    var fullName: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
            && fullName?.isEmpty == false
            && password?.isEmpty == false
    }
}
