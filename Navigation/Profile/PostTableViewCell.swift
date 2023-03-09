//
//  CustomCell.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 27.02.2023.
//

import UIKit

class  PostTableViewCell: UITableViewCell {
    
    private let contentWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
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
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .systemGray
        return label
    }()
    
    private let likes: UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.font = .systemFont(ofSize: 16, weight: .regular)
        return likes
    }()
    
    private let views: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.font = .systemFont(ofSize: 16, weight: .regular)
        return views
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customizeCell()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: ProfilePosts) {
        ImageView.image = model.image
        authorName.text = model.author
        descriptionText.text = model.description
        likes.text = "Likes: \(String(model.likes))"
        views.text = "Views: \(String(model.views))"
    }
    
    override func prepareForReuse() {
            super.prepareForReuse()
            self.accessoryType = .none
        }

    private func customizeCell() {
        contentWhiteView.backgroundColor = .white
        contentWhiteView.layer.borderColor = UIColor.black.cgColor
    }
    
    private func layout() {
        [contentWhiteView, ImageView, authorName, descriptionText, likes, views].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            contentWhiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentWhiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentWhiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentWhiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        
            authorName.topAnchor.constraint(equalTo: contentWhiteView.topAnchor, constant: 16),
            authorName.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: 16),
        
            ImageView.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: 12),
            ImageView.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: 0),
            ImageView.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: 0),
            ImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            ImageView.widthAnchor.constraint(equalTo: contentWhiteView.widthAnchor),
       
            descriptionText.topAnchor.constraint(equalTo: ImageView.bottomAnchor, constant: 10),
            descriptionText.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: 16),
            descriptionText.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -16),
        
            likes.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 16),
            likes.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: 16),
            likes.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -16),
    
            views.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 16),
            views.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -16),
            views.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -16)
        ])
    }
}

