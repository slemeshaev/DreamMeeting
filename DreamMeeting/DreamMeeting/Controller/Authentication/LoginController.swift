//
//  LoginController.swift
//  DreamMeeting
//
//  Created by Станислав Лемешаев on 06.02.2021.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Properties
    
    private var loginViewModel = LoginViewModel()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "app_icon").withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .white
        return imageView
    }()
    
    private let emailTextField = CustomTextFiled(placeholder: "Email")
    private let passwordTextField = CustomTextFiled(placeholder: "Password",
                                                    isSecureText: true)
    private let authButton: AuthButton = {
        let button = AuthButton(title: "Войти", type: .system)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "У вас еще нет учетной записи? ",
                                                        attributes: [.foregroundColor: UIColor.white,
                                                                     .font: UIFont.systemFont(ofSize: 16)])
        attributedTitle.append(NSAttributedString(string: "Войти",
                                                  attributes: [.foregroundColor: UIColor.white,
                                                               .font: UIFont.boldSystemFont(ofSize: 16)]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTextFieldObservers()
    }
    
    // MARK: - Actions
    
    @objc func handleLogin() {
        print(#function)
    }
    
    @objc func goToSignUp() {
        navigationController?.pushViewController(SignUpController(), animated: true)
    }
    
    @objc func textDidChanged(sender: UITextField) {
        if sender == emailTextField {
            loginViewModel.email = sender.text
        } else {
            loginViewModel.password = sender.text
        }
        checkFormStatus()
    }
    
    // MARK: - Helpers
    
    private func checkFormStatus() {
        if loginViewModel.formIsValid {
            authButton.isEnabled = true
            authButton.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        } else {
            authButton.isEnabled = false
            authButton.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        }
    }
    
    private func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        configureGradientLayer()
        
        view.addSubview(iconImageView)
        
        iconImageView.centerX(inView: view)
        iconImageView.setDimensions(height: 100, width: 100)
        iconImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, authButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.addSubview(stackView)
        stackView.anchor(top: iconImageView.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 24,
                         paddingLeft: 32,
                         paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left: view.leftAnchor,
                                     bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                     right: view.rightAnchor,
                                     paddingLeft: 32,
                                     paddingBottom: 16,
                                     paddingRight: 32)
    }
    
    private func configureTextFieldObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChanged), for: .editingChanged)
    }
    
}
