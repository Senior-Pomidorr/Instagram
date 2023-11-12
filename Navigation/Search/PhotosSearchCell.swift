//
//  PhotosSearchCell.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 12.11.2023.
//

import UIKit
import Kingfisher

class PhotosSearchCell: UICollectionViewCell {
    
    lazy var photoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
//        image.backgroundColor = .red
        image.clipsToBounds = true
        return image.autoLayout()
    }()
    
    var unsplashPhoto: UnsplashPhoto! {
        didSet {
            let photoUrl = unsplashPhoto.urls["regular"]
            guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
            photoImage.kf.setImage(with: url)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImage.image = nil
    }
    
    private func setupLayout() {
        addSubview(photoImage)
        
        NSLayoutConstraint.activate([
            photoImage.topAnchor.constraint(equalTo: self.topAnchor),
            photoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            photoImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            photoImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
