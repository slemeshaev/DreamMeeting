//
//  SignUpController.swift
//  DreamMeeting
//
//  Created by Станислав Лемешаев on 06.02.2021.
//

import UIKit

class SignUpController: UIViewController {
    
    // MARK: - Properties
    
    private var signUpViewModel = SignUpViewModel()
    
    private let selectPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()
    
    private let emailTextField = CustomTextFiled(placeholder: "Email")
    private let fullNameTextField = CustomTextFiled(placeholder: "Полное имя")
    private let passwordTextField = CustomTextFiled(placeholder: "Пароль",
                                                    isSecureText: true)
    private let authButton: AuthButton = {
        let button = AuthButton(title: "Зарегистрироваться", type: .system)
        button.addTarget(self, action: #selector(handleSignUpUser), for: .touchUpInside)
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
        configureTextFieldObservers()
    }
    
    // MARK: - Actions
    
    @objc func handleSelectPhoto() {
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    @objc func handleSignUpUser() {
        AuthService.registerUser()
    }
    
    @objc func goToSignIn() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func textDidChanged(sender: UITextField) {
        if sender == emailTextField {
            signUpViewModel.email = sender.text
        } else if sender == fullNameTextField {
            signUpViewModel.fullName = sender.text
        } else {
            signUpViewModel.password = sender.text
        }
    }
    
    // MARK: - Helpers
    
    private func checkFormStatus() {
        if signUpViewModel.formIsValid {
            authButton.isEnabled = true
            authButton.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        } else {
            authButton.isEnabled = false
            authButton.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        }
    }
    
    private func configureUI() {
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
    
    private func configureTextFieldObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChanged), for: .editingChanged)
        fullNameTextField.addTarget(self, action: #selector(textDidChanged), for: .editingChanged)
    }
    
}

// MARK: - UIImagePickerControllerDelegate

extension SignUpController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        selectPhotoButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        selectPhotoButton.layer.borderColor = UIColor(white: 1, alpha: 0.7).cgColor
        selectPhotoButton.layer.borderWidth = 3
        selectPhotoButton.layer.cornerRadius = 10
        selectPhotoButton.imageView?.contentMode = .scaleAspectFill
        
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UINavigationControllerDelegate

extension SignUpController: UINavigationControllerDelegate {
    //
}
