//
//  LoginController.swift
//  DreamMeeting
//
//  Created by Станислав Лемешаев on 06.02.2021.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Properties
    
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
    
    private let goToRegistrationButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "У вас еще нет учетной записи?  ",
                                                 attributes: [.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Войти",
                                                  attributes: [.foregroundColor: UIColor.white,
                                                               .font: UIFont.boldSystemFont(ofSize: 16)]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleSingUp), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Actions
    
    @objc func handleLogin() {
        print(#function)
    }
    
    @objc func handleSingUp() {
        print(#function)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
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
    }
    
}
