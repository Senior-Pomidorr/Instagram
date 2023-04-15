//
//  PhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 05.03.2023.
//

import UIKit

protocol CellDelegate: AnyObject {
    func didTapImageInCell(_ image: UIImage?, imageRect: CGRect, indexPath: IndexPath)
}

class PhotoCollectionViewCell: UICollectionViewCell {
    
    weak var cellDelegate: CellDelegate?
    private var indexPathCell = IndexPath()
    
    lazy var imageViewCell: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateImageCell)))
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(photo: PhotoPosts) {
        imageViewCell.image = UIImage(named: photo.image)
    }
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    @objc func animateImageCell() {
        cellDelegate?.didTapImageInCell(imageViewCell.image, imageRect: imageViewCell.frame, indexPath: indexPathCell)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageViewCell.image = nil
    }
    
    private func layout() {
        contentView.addSubview(imageViewCell)
        NSLayoutConstraint.activate([
            imageViewCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageViewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageViewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
