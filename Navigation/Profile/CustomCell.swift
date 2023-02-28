//
//  CustomCell.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 27.02.2023.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {
    
    private let contentWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let carImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let carText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray4
        return label
    }()
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray4
        label.numberOfLines = 0
        return label
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
        carImageView.image = model.image
        carText.text = model.author
        descriptionText.text = model.description
        
    }
    
    private func customizeCell() {
        contentWhiteView.backgroundColor = .systemGray6
        contentWhiteView.layer.cornerRadius = 10
        contentWhiteView.layer.borderWidth = 2
        contentWhiteView.layer.borderColor = UIColor.black.cgColor
    }
    
    private func layout() {
//        contentView.addSubview(contentWhiteView)
        [contentWhiteView, carImageView, carText, descriptionText].forEach { contentView.addSubview($0) }
//        [contentWhiteView, carImageView, carText].forEach { contentView.addSubview($0) }
        
        let heightView: CGFloat = 100
        let viewInset: CGFloat = 8
        let imageInset: CGFloat = 10
        
        NSLayoutConstraint.activate([
            contentWhiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: viewInset),
            contentWhiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset),
            contentWhiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -viewInset),
            contentWhiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset),
            /// 1 убрать высоту
//            contentWhiteView.heightAnchor.constraint(equalToConstant: heightView)
        ])
        
        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: contentWhiteView.topAnchor, constant: imageInset),
            carImageView.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: imageInset),
//            carImageView.heightAnchor.constraint(equalToConstant: heightView - imageInset * 2),
            carImageView.widthAnchor.constraint(equalToConstant: heightView - imageInset * 2),
            /// 2 добавить нижний констрейнт
            carImageView.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -imageInset)
        ])
        
        NSLayoutConstraint.activate([
            carText.topAnchor.constraint(equalTo: carImageView.topAnchor),
            carText.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 16),
            carText.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            descriptionText.topAnchor.constraint(equalTo: carText.bottomAnchor, constant: 10),
            descriptionText.leadingAnchor.constraint(equalTo: carText.leadingAnchor),
            descriptionText.trailingAnchor.constraint(equalTo: carText.trailingAnchor),
            descriptionText.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -imageInset)
        ])
    }
}

