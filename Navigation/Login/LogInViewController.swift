//
//  LogInViewController.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 24.02.2023.
//

import UIKit

final class LogInViewController: UIViewController {
    
    private let notifiacation = NotificationCenter.default
    
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
    
    lazy var textFieldLogin: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email of phone"
        textField.delegate = self
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = UIColor.tintColor
        textField.autocapitalizationType = .none
        textField.layer.backgroundColor = UIColor.systemGray6.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.indent(size: 10)
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return textField
    }()
    
    lazy var textFieldPassword: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email of phone"
        textField.delegate = self
        textField.isSecureTextEntry = true
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = UIColor.tintColor
        textField.autocapitalizationType = .none
        textField.layer.backgroundColor = UIColor.systemGray6.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.indent(size: 10)
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return textField
    }()
    
    private lazy var logInButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(logInButtonAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loyout()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notifiacation.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notifiacation.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        notifiacation.removeObserver(UIResponder.keyboardWillShowNotification)
        notifiacation.removeObserver(UIResponder.keyboardWillHideNotification)
    }
    
    
    @objc private func logInButtonAction() {
        let profileView = ProfileViewController()
             navigationController?.pushViewController(profileView, animated: true)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private func loyout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImage)
        contentView.addSubview(textFieldLogin)
        contentView.addSubview(textFieldPassword)
        contentView.addSubview(logInButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            
            textFieldLogin.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            textFieldLogin.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textFieldLogin.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textFieldLogin.heightAnchor.constraint(equalToConstant: 50),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldLogin.bottomAnchor),
            textFieldPassword.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textFieldPassword.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textFieldPassword.heightAnchor.constraint(equalToConstant: 50),
            
            logInButton.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
        ])
    }
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}


