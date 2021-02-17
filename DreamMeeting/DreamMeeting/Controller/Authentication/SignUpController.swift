//
//  SignUpController.swift
//  DreamMeeting
//
//  Created by Станислав Лемешаев on 06.02.2021.
//

import UIKit

class SignUpController: UIViewController {
    
    // MARK: - Properties
    
    private let selectPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        return button
    }()
    
    private let emailTextField = CustomTextFiled(placeholder: "Email")
    private let fullNameTextField = CustomTextFiled(placeholder: "Полное имя")
    private let passwordTextField = CustomTextFiled(placeholder: "Пароль",
                                                    isSecureText: true)
    private let authButton: AuthButton = {
        let button = AuthButton(title: "Зарегистрироваться", type: .system)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "У вас уже есть аккаунт?  ",
                                                        attributes: [.foregroundColor: UIColor.white,
                                                                     .font: UIFont.systemFont(ofSize: 16)])
        attributedTitle.append(NSAttributedString(string: "Войти",
                                                  attributes: [.foregroundColor: UIColor.white,
                                                               .font: UIFont.boldSystemFont(ofSize: 16)]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(goToSignIn), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Actions
    
    @objc func handleSelectPhoto() {
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    @objc func handleSignUp() {
        print(#function)
    }
    
    @objc func goToSignIn() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        configureGradientLayer()
        
        view.addSubview(selectPhotoButton)
        selectPhotoButton.setDimensions(height: 275, width: 275)
        selectPhotoButton.centerX(inView: view)
        selectPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 8)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, fullNameTextField,
                                                       passwordTextField, authButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.addSubview(stackView)
        stackView.anchor(top: selectPhotoButton.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 16,
                         paddingLeft: 32,
                         paddingRight: 32)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(left: view.leftAnchor,
                                     bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                     right: view.rightAnchor,
                                     paddingLeft: 32,
                                     paddingBottom: 16,
                                     paddingRight: 32)
    }
    
}

// MARK: - UIImagePickerControllerDelegate

extension SignUpController: UIImagePickerControllerDelegate {
    //
}

// MARK: - UINavigationControllerDelegate

extension SignUpController: UINavigationControllerDelegate {
    //
}
