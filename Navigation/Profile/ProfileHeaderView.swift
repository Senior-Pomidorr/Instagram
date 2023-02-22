//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 18.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var profileView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return view
    }()

    
    private let setStatusButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.backgroundColor = #colorLiteral(red: 0, green: 0.4780646563, blue: 0.9985368848, alpha: 1)
        button.layer.cornerRadius = 16
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        return button
    }()
    
    private let avatarImageView: UIImageView = {
        var photo = UIImageView()
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.image = Picture.picturePhoto
        photo.contentMode = .scaleAspectFill
        photo.layer.cornerRadius = 50
        photo.layer.borderWidth = 3
        photo.layer.borderColor = UIColor.white.cgColor
        return photo
    }()
    
    var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Kanye West"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Waiting for something"
        statusLabel.font = .systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        return statusLabel
    }()
    
    var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "Waiting for something"
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.layer.cornerRadius = 16
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()

    private let changeTitleButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("changeTitle", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.backgroundColor = #colorLiteral(red: 0, green: 0.4780646563, blue: 0.9985368848, alpha: 1)
        return button
    }()
    
    func button() -> UIButton {
        setStatusButton
    }
    
    
    
    func customizeViews() {
        backgroundColor = .white
        addSubview(profileView)
        profileView.addSubview(setStatusButton)
        profileView.addSubview(avatarImageView)
        profileView.addSubview(fullNameLabel)
        profileView.addSubview(statusTextField)
        profileView.addSubview(statusLabel)
        profileView.addSubview(changeTitleButton)
        
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            avatarImageView.topAnchor.constraint(equalTo: profileView.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: profileView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 36),
            setStatusButton.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -16),
            setStatusButton.widthAnchor.constraint(equalToConstant: 360),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
        
            fullNameLabel.topAnchor.constraint(equalTo: profileView.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 26),
            
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -54),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -16),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 6),
            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            changeTitleButton.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 0),
            changeTitleButton.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: 0),
            changeTitleButton.bottomAnchor.constraint(equalTo: profileView.safeAreaLayoutGuide.bottomAnchor),
            changeTitleButton.heightAnchor.constraint(equalToConstant: 50),
            
            
           ])
         
    }


    init() {
        super.init(frame: .zero)
        customizeViews()
        layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


