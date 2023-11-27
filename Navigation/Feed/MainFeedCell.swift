//
//  FeedCell.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 03.11.2023.
//

import UIKit
import Kingfisher

protocol mainViewCellDelagate: AnyObject {
    func tapLikeButton()
    func tapComment()
    func tapMessage()
    func tapBookmark()
}

final class MainFeedCell: UICollectionViewCell {
    
    weak var delegate: mainViewCellDelagate?
    
    private lazy var contentViewCell: UIView = {
        let content = UIView()
        content.layer.borderColor = UIColor.black.cgColor
        return content.autoLayout()
    }()
    
    private lazy var avatarImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 16
        image.backgroundColor = .red
        image.clipsToBounds = true
        return image.autoLayout()
    }()
    
    private lazy var autorName: UILabel = {
        let label = UILabel()
        label.text = "Author Name"
        label.font = .systemFont(ofSize: 13, weight: .semibold)
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
    
    lazy var photoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image.autoLayout()
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Like"), for: .normal)
        button.addTarget(self, action: #selector(tapLikeButton), for: .touchUpInside)
        return button.autoLayout()
    }()
    
    lazy var textLikes: UITextView = {
       let text = UITextView()
        text.textColor = .black
        text.font = .systemFont(ofSize: 16)
        return text.autoLayout()
    }()
    
    lazy var descriptionText: UITextView = {
       let text = UITextView()
        text.textColor = .black
        text.text = "Some Description"
        text.font = .systemFont(ofSize: 16)
        text.textAlignment = .left
        text.textContainer.maximumNumberOfLines = 3
        return text.autoLayout()
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Comment"), for: .normal)
        button.addTarget(self, action: #selector(tapComment), for: .touchUpInside)
        return button.autoLayout()
    }()
    
    private lazy var messageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Messanger"), for: .normal)
        button.addTarget(self, action: #selector(tapMessage), for: .touchUpInside)
        return button.autoLayout()
    }()
    
    private lazy var bookmarksButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Save"), for: .normal)
        button.addTarget(self, action: #selector(tapBookmark), for: .touchUpInside)
        return button.autoLayout()
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 14
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .leading
        return stack.autoLayout()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layoutCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImage.image = nil
        avatarImage.image = nil
        autorName.text = nil
        textLikes.text = nil
    }
    
    //MARK: - CofigureCell
    func configure(_ post: [UnsplashPhoto], indexPath: IndexPath) {
        guard let urlString = post[indexPath.item].urls["regular"] else { return }
        let url = URL(string: urlString)
        self.photoImage.kf.indicatorType = .activity
        self.photoImage.kf.setImage(with: url)
        self.textLikes.text = "Likes: \(String(post[indexPath.item].likes))"
        
        guard let urlPhotoString = post[indexPath.item].user.profile_image["medium"] else { return }
        let urlPhoto = URL(string: urlPhotoString)
        self.avatarImage.kf.setImage(with: urlPhoto)
        self.autorName.text = post[indexPath.item].user.username
//        self.descriptionText.text = post[indexPath.item].cover_photo.description
    }
    
    func configureMainFeed(_ post: [FeedPhotos], indexPath: IndexPath) {
        guard let urlString = post[indexPath.item].urls["regular"] else { return }
        let url = URL(string: urlString)
        self.photoImage.kf.indicatorType = .activity
        self.photoImage.kf.setImage(with: url)
        self.textLikes.text = "Likes: \(String(post[indexPath.item].likes))"
        self.descriptionText.text = post[indexPath.item].description
        
        guard let urlPhotoString = post[indexPath.item].urls["regular"] else { return }
        let urlPhoto = URL(string: urlPhotoString)
        self.avatarImage.kf.setImage(with: urlPhoto)
        self.autorName.text = post[indexPath.item].user.username
    }
    
    @objc func tapLikeButton() {
        delegate?.tapLikeButton()
    }
    
    @objc func tapComment() {
        delegate?.tapComment()
    }
    
    @objc func tapMessage() {
        delegate?.tapMessage()
    }
    
    @objc func tapBookmark() {
        delegate?.tapBookmark()
    }
    
    //MARK: - Layout
    private func layoutCell() {
        contentView.addSubview(contentViewCell)
        
        [avatarImage, autorName, locationName, photoImage, stack , bookmarksButton, textLikes, descriptionText].forEach { contentViewCell.addSubview($0) }
        
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
            bookmarksButton.topAnchor.constraint(equalTo: photoImage.bottomAnchor, constant: 14),
            
            textLikes.leadingAnchor.constraint(equalTo: contentViewCell.leadingAnchor, constant: 10),
            textLikes.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 5),
            textLikes.trailingAnchor.constraint(equalTo: contentViewCell.trailingAnchor, constant: -14),
            textLikes.heightAnchor.constraint(equalToConstant: 40),
            
            descriptionText.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 5),
            descriptionText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            descriptionText.trailingAnchor.constraint(equalTo: contentViewCell.trailingAnchor, constant: -14),
            descriptionText.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
}
