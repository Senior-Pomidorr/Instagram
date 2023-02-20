//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 18.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
   
    private let backgroundColorView: UIView = {
        let backgroundColorView = UIView()
        return backgroundColorView
        
    }()
    
     private let showStatusButton: UIButton = {
        var button = UIButton(frame: CGRect(x: 20, y: 216, width: 350, height: 50))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 16
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        return button
    }()
    
    private let photoProfile: UIImageView = {
        var photo = UIImageView(frame: CGRect(x: 16, y: 100, width: 100, height: 100))
        photo.clipsToBounds = true
        photo.image = picture.picturePhoto
        photo.contentMode = .scaleAspectFill
        photo.layer.cornerRadius = 50
        photo.layer.borderWidth = 3
        photo.layer.borderColor = UIColor.white.cgColor
        return photo
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 150, y: 97, width: 350, height: 50))
        label.text = "Kanye West"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
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
    
    
    
    func customizeViews() {
        addSubview(backgroundColorView)
        backgroundColorView.addSubview(showStatusButton)
        backgroundColorView.addSubview(photoProfile)
        backgroundColorView.addSubview(nameLabel)
    }
//        backgroundColorView.addSubview(showStatusButton)
//        NSLayoutConstraint.activate([
//            showStatusButton.topAnchor.constraint(equalTo: backgroundColorView.safeAreaLayoutGuide.topAnchor, constant: 350),
//            showStatusButton.leadingAnchor.constraint(equalTo: backgroundColorView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
////            showStatusButton.trailingAnchor.constraint(equalTo: backgroundColorView.trailingAnchor, constant: -120)
//            showStatusButton.widthAnchor.constraint(equalToConstant: 350),
//            showStatusButton.heightAnchor.constraint(equalToConstant: 60)
//
//        ])
    
    
    
   
    
    
    
    enum picture {
        static var picturePhoto = UIImage(named: "kanye west")
    }



}
