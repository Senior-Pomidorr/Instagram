//
//  FeedCell.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 03.11.2023.
//

import UIKit

class MainFeedCell: UITableViewCell {
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutCell() {
        contentView.addSubview(contentViewCell)
        contentViewCell.addSubview(avatarImage)
        contentViewCell.addSubview(autorName)
        contentViewCell.addSubview(locationName)
        
        NSLayoutConstraint.activate([
            contentViewCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentViewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentViewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            contentViewCell.heightAnchor.constraint(equalToConstant: 375),
            
            avatarImage.leadingAnchor.constraint(equalTo: contentViewCell.leadingAnchor, constant: 10),
            avatarImage.topAnchor.constraint(equalTo: contentViewCell.topAnchor, constant: 11),
            avatarImage.heightAnchor.constraint(equalToConstant: 32),
            avatarImage.widthAnchor.constraint(equalToConstant: 32),
            
            autorName.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 10),
            autorName.topAnchor.constraint(equalTo: contentViewCell.topAnchor, constant: 11),
            
            locationName.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 10),
            locationName.topAnchor.constraint(equalTo: autorName.bottomAnchor, constant: 1)
        ])
    }
       
}
