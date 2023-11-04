//
//  CustomCell.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 27.02.2023.
//

import UIKit


final class PostTableViewCell: UITableViewCell {
    
    var profilePost: [ProfilePosts] = ProfilePosts.showPosts()
    private var indexPathCell = IndexPath()
    private var buttonWasPressed = false
    
    private let contentWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    private lazy var ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
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
    
    private lazy var likes: UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.font = .systemFont(ofSize: 16, weight: .regular)
        likes.isUserInteractionEnabled = true
        likes.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapLikes)))
        return likes
    }()
    
    lazy var views: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.font = .systemFont(ofSize: 16, weight: .regular)
        return views
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
    
    func setupCustomCell(with model: IndexPath) {
        indexPathCell = model
        ImageView.image = profilePost[indexPathCell.row].image
        authorName.text = profilePost[indexPathCell.row].author 
        descriptionText.text = profilePost[indexPathCell.row].description
        likes.text = "Likes: \(String(profilePost[indexPathCell.row].likes))"
        views.text = "Views: \(String(profilePost[indexPathCell.row].views))"
    }
    
    @objc func tapLikes(gesture: UITapGestureRecognizer) {
        var post = ProfilePosts.showPosts()
        if buttonWasPressed == false {
            post[indexPathCell.row].likes += 1
            post[indexPathCell.row].views += 1
            print("Tap like")
            profilePost.remove(at: indexPathCell.row)
            profilePost.insert(post[indexPathCell.row], at: indexPathCell.row)
            likes.text = "Likes: \(String(profilePost[indexPathCell.row].likes))"
            views.text = "Views: \(String(profilePost[indexPathCell.row].views))"
            animationHeart()
            buttonWasPressed = true
        } else {
            profilePost.remove(at: indexPathCell.row)
            profilePost.insert(post[indexPathCell.row], at: indexPathCell.row)
            likes.text = "Likes: \(String(profilePost[indexPathCell.row].likes))"
            animationHeart()
            buttonWasPressed = false
        }
    }
    
    private func animationHeart() {
        let heart = UIImageView(image: UIImage(systemName: "heart.fill"))
        let size = ImageView.frame.size.width/3
        heart.frame = CGRect(x: (ImageView.frame.size.width - size)/2 - 10,
                             y: (ImageView.frame.size.height - size)/2,
                             width: size + 20,
                             height: size)
        heart.tintColor = .white
        ImageView.addSubview(heart)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            UIView.animate(withDuration: 1, animations: {
                heart.alpha = 0
            }, completion: { done in
                if done {
                    heart.removeFromSuperview()
                }
            })
        })
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





