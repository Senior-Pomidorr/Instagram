//
//  LogInViewController.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 24.02.2023.
//

import UIKit

final class LogInViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIScrollView())
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()
    
    private let logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = Picture.logo
        return logoImage
    }()
    
    lazy var TextFieldLogin: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "Email of phone"
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = UIColor.tintColor
        textField.autocapitalizationType = .none
        textField.layer.backgroundColor = UIColor.systemGray6.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        textField.addTarget(self, action: #selector(statusLabelChanged), for: .editingChanged)
        return textField
    }()
    
    lazy var TextFieldPassword: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "Email of phone"
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = UIColor.tintColor
        textField.autocapitalizationType = .none
        textField.layer.backgroundColor = UIColor.systemGray6.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
//        textField.isSecureTextEntry = true
//        textField.addTarget(self, action: #selector(statusLabelChanged), for: .editingChanged)
        return textField
    }()
    
    private lazy var LogInButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.backgroundColor = #colorLiteral(red: 0, green: 0.4780646563, blue: 0.9985368848, alpha: 1)
        button.layer.cornerRadius = 16
//        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loyout()

    }
    
    private func loyout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImage)
        contentView.addSubview(TextFieldLogin)
        contentView.addSubview(TextFieldPassword)
        contentView.addSubview(LogInButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            
            TextFieldLogin.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            TextFieldLogin.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            TextFieldLogin.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            TextFieldLogin.heightAnchor.constraint(equalToConstant: 50),
            
            TextFieldPassword.topAnchor.constraint(equalTo: TextFieldLogin.bottomAnchor),
            TextFieldPassword.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            TextFieldPassword.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            TextFieldPassword.heightAnchor.constraint(equalToConstant: 50),
            
            LogInButton.topAnchor.constraint(equalTo: TextFieldPassword.bottomAnchor, constant: 16),
            LogInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            LogInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            LogInButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        
        
    }

    
}
