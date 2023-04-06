//
//  ViewControllerPos.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 31.03.2023.
//

import UIKit

class ShowPostView: UIView {
    
    private let contentWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    private let authorName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Kanye West"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .systemGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(model: ProfilePosts) {
        ImageView.image = model.image
        authorName.text = model.author
        descriptionText.text = model.description
    }
    
    private func layout() {
        [contentWhiteView, ImageView, authorName, descriptionText].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            contentWhiteView.topAnchor.constraint(equalTo: topAnchor),
            contentWhiteView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentWhiteView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentWhiteView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            authorName.topAnchor.constraint(equalTo: contentWhiteView.topAnchor, constant: 16),
            authorName.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: 16),
            
            ImageView.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: 12),
            ImageView.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: 0),
            ImageView.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: 0),
            ImageView.heightAnchor.constraint(equalTo: contentWhiteView.widthAnchor),
            ImageView.widthAnchor.constraint(equalTo: contentWhiteView.widthAnchor),
            
            descriptionText.topAnchor.constraint(equalTo: ImageView.bottomAnchor, constant: 10),
            descriptionText.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: 16),
            descriptionText.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -16),
            
        ])
    }
}









