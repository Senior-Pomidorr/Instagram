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

    
    private let showStatusButton: UIButton = {
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
    
    private let photoProfile: UIImageView = {
        var photo = UIImageView()
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.image = picture.picturePhoto
        photo.contentMode = .scaleAspectFill
        photo.layer.cornerRadius = 50
        photo.layer.borderWidth = 3
        photo.layer.borderColor = UIColor.white.cgColor
        return photo
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Kanye West"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "Waiting for something"
        textField.font = .systemFont(ofSize: 14, weight: .regular)
        textField.textColor = .gray
        return textField
    }()
    
    func button() -> UIButton {
        showStatusButton
    }
    
    
    
    init() {
        super.init(frame: .zero)
        customizeViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
    
extension ProfileHeaderView {
    func customizeViews() {
        backgroundColor = .white
        addSubview(profileView)
        profileView.addSubview(showStatusButton)
        profileView.addSubview(photoProfile)
        profileView.addSubview(nameLabel)
        
        
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            photoProfile.topAnchor.constraint(equalTo: profileView.safeAreaLayoutGuide.topAnchor, constant: 16),
            photoProfile.leadingAnchor.constraint(equalTo: profileView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            photoProfile.widthAnchor.constraint(equalToConstant: 100),
            photoProfile.heightAnchor.constraint(equalToConstant: 100),
            
            showStatusButton.topAnchor.constraint(equalTo: photoProfile.bottomAnchor, constant: 16),
            showStatusButton.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -16),
            showStatusButton.widthAnchor.constraint(equalToConstant: 360),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: profileView.safeAreaLayoutGuide.topAnchor, constant: 27),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)

         
            
           ])
         
    
        
    }
    enum picture {
        static var picturePhoto = UIImage(named: "kanye west")
    }
}
