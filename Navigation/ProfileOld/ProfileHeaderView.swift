//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 18.02.2023.
//

import UIKit

protocol HeaderDelegate: AnyObject {
    func tapImage(_ image: UIImage?, imageRect: CGRect)
}

final class ProfileHeaderView: UIView {
    
    weak var myDelegate: HeaderDelegate?
    private var statusText = ""
    
    private var profileView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = #colorLiteral(red: 0.9490192533, green: 0.9490200877, blue: 0.9662286639, alpha: 1)
        return view
    }()
    
    private lazy var setStatusButton: UIButton = {
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
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var avatarImageView: UIImageView = {
        var photo = UIImageView()
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.image = Picture.picturePhoto
        photo.contentMode = .scaleAspectFill
        photo.layer.cornerRadius = 50
        photo.layer.borderWidth = 3
        photo.layer.borderColor = UIColor.white.cgColor
        photo.isUserInteractionEnabled = true
        photo.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGesture)))
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
        statusLabel.text = "Preparing a new album"
        statusLabel.font = .systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        return statusLabel
    }()
    
    lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Write something"
        textField.delegate = self
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 12
        textField.indent(size: 10)
        textField.layer.borderColor = UIColor.black.cgColor
        textField.addTarget(self, action: #selector(statusLabelChanged), for: .editingChanged)
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func actionButton() {
        statusLabel.text = statusText
        print (statusLabel.text ?? "nil")
        if statusTextField.text!.isEmpty {
            AnimationButtonStatus()
            statusTextField.placeholder = "Status is a clear"
        }
    }
    
    @objc private func statusLabelChanged(_ textField: UITextField) {
        if let text = statusTextField.text {
            statusText = text
        }
    }
    
    @objc private func tapGesture() {
        myDelegate?.tapImage(avatarImageView.image, imageRect: avatarImageView.frame)
    }
    
    private func AnimationButtonStatus() {
        let animationText = CABasicAnimation(keyPath: "position")
        animationText.duration = 0.09
        animationText.repeatCount = 4
        animationText.autoreverses = true
        animationText.fromValue = NSValue(cgPoint: CGPoint(x: statusTextField.center.x, y: statusTextField.center.y + 3))
        animationText.toValue = NSValue(cgPoint: CGPoint(x: statusTextField.center.x, y: statusTextField.center.y - 3))
        statusTextField.layer.add(animationText, forKey: "position")
    }
    
    func customizeViews() {
        backgroundColor = .white
        addSubview(profileView)
        profileView.addSubview(setStatusButton)
        profileView.addSubview(fullNameLabel)
        profileView.addSubview(statusTextField)
        profileView.addSubview(statusLabel)
        profileView.addSubview(avatarImageView)
        
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileView.heightAnchor.constraint(equalToConstant: 220),
            
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
        ])
    }
    
}

extension ProfileHeaderView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if statusTextField.text == nil {
        }
        return true
    }
}

