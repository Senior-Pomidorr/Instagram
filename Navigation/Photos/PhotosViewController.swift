//
//  CollectionView.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 03.03.2023.
//

import UIKit

final class PhotosViewController: UIViewController {
    
    private let photos = photoCels
    private let collectionsPhoto = PhotoCollectionViewCell()
    private var initialImageRect: CGRect = .zero
    
    private lazy var collectionViewPhotos: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private func photosNavigationController() {
        navigationController?.navigationBar.tintColor = UIColor.systemBlue
        navigationController?.navigationBar.isHidden = false
        title = "Photo Gallery"
        view.backgroundColor = .white
    }
    
    private let whiteView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.height))
        view.backgroundColor = .white
        view.alpha = 0.95
        return view
    }()
    
    private let animatingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var closeButton: UIButton = {
        let config = UIImage.SymbolConfiguration(scale: .large)
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 70, y: 60, width: 60, height: 60))
        button.setImage(UIImage(systemName: "xmark.square"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9351107478, green: 0.9589754939, blue: 0.9585590959, alpha: 1)
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(closeAnimation), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        photosNavigationController()
    }
    
    private func layout() {
        view.addSubview(collectionViewPhotos)
        NSLayoutConstraint.activate([
            collectionViewPhotos.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionViewPhotos.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionViewPhotos.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionViewPhotos.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var sideInset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        cell.setupCell(photo: photoCels[indexPath.item])
        cell.setIndexPath(indexPath)
        cell.cellDelegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 5) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
    
    func animateImage(_ image: UIImage?, imageFrame: CGRect) {
        view.addSubview(whiteView)
        view.addSubview(animatingImageView)
        animatingImageView.image = image
        animatingImageView.alpha = 1
        animatingImageView.frame = initialImageRect
        UIView.animate(withDuration: 0.350) { [self] in
            animatingImageView.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            animatingImageView.center = self.view.center
            navigationController?.navigationBar.isHidden = true
        } completion: { _ in
            self.view.addSubview(self.closeButton)
        }
    }
    
    @objc func closeAnimation(rect: CGRect) {
        closeButton.removeFromSuperview()
        whiteView.removeFromSuperview()
        
        UIView.animate(withDuration: 0.4) {
            self.animatingImageView.frame = rect
            self.animatingImageView.alpha = 0.2
            self.navigationController?.navigationBar.isHidden = false
        } completion: { _ in
            self.animatingImageView.removeFromSuperview()
        }
    }
}

extension PhotosViewController: CellDelegate {
    func didTapImageInCell(_ image: UIImage?, imageRect: CGRect, indexPath: IndexPath) {
        animateImage(image, imageFrame: initialImageRect)
    }
    
}

