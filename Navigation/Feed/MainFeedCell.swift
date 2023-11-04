//
//  FeedCell.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 03.11.2023.
//

import UIKit

final class MainFeedCell: UICollectionViewCell {
    
    private lazy var contentViewCell: UIView = {
        let content = UIView()
        content.backgroundColor = .white
        content.layer.borderColor = UIColor.black.cgColor
        return content.autoLayout()
    }()
    
    private lazy var avatarImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 16
        image.backgroundColor = .red
        return image.autoLayout()
    }()
    
    private lazy var autorName: UILabel = {
        let label = UILabel()
        label.text = "Author Name"
        label.font = .systemFont(ofSize: 13)
        label.textColor = .black
        return label.autoLayout()
    }()
    
    private lazy var locationName: UILabel = {
        let label = UILabel()
        label.text = "Tokio, City"
        label.font = .systemFont(ofSize: 13)
        label.textColor = .black
        return label.autoLayout()
    }()
    
    private lazy var photoImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.contentMode = .scaleAspectFit
        return image.autoLayout()
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 14
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .leading
        return stack.autoLayout()
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Like"), for: .normal)
        return button.autoLayout()
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Comment"), for: .normal)
        return button.autoLayout()
    }()
    
    private lazy var messageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Messanger"), for: .normal)
        return button.autoLayout()
    }()
    
    private lazy var bookmarksButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Save"), for: .normal)
        return button.autoLayout()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layoutCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutCell() {
        contentView.addSubview(contentViewCell)
        
        [avatarImage, autorName, locationName, photoImage, stack , bookmarksButton].forEach { contentViewCell.addSubview($0) }
        
        [likeButton, commentButton, messageButton].forEach { stack.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            contentViewCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentViewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentViewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                    
            avatarImage.leadingAnchor.constraint(equalTo: contentViewCell.leadingAnchor, constant: 10),
            avatarImage.topAnchor.constraint(equalTo: contentViewCell.topAnchor, constant: 11),
            avatarImage.heightAnchor.constraint(equalToConstant: 32),
            avatarImage.widthAnchor.constraint(equalToConstant: 32),
            
            autorName.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 10),
            autorName.topAnchor.constraint(equalTo: contentViewCell.topAnchor, constant: 11),
            
            locationName.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 10),
            locationName.topAnchor.constraint(equalTo: autorName.bottomAnchor, constant: 1),
            
            photoImage.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 11),
            photoImage.leadingAnchor.constraint(equalTo: contentViewCell.leadingAnchor),
            photoImage.trailingAnchor.constraint(equalTo: contentViewCell.trailingAnchor),
            photoImage.heightAnchor.constraint(equalToConstant: 375),
            
            stack.topAnchor.constraint(equalTo: photoImage.bottomAnchor, constant: 14),
            stack.leadingAnchor.constraint(equalTo: contentViewCell.leadingAnchor, constant: 14),
            stack.heightAnchor.constraint(equalToConstant: 24),
            
            bookmarksButton.trailingAnchor.constraint(equalTo: contentViewCell.trailingAnchor, constant: -14),
            bookmarksButton.topAnchor.constraint(equalTo: photoImage.bottomAnchor, constant: 14)
        ])
    }
    
}
