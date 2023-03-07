//
//  CollectionView.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 03.03.2023.
//

import UIKit

final class PhotosViewController: UIViewController {
    
    private let photos = photoCels
    
    private let collectionViewCell: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        return collectionView
    }()
    
    func setupCollectionView() {
        collectionViewCell.dataSource = self
        collectionViewCell.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setupCollectionView()
        photosNavigationController()
    }
    
    private func photosNavigationController() {
        navigationController?.navigationBar.tintColor = UIColor.systemBlue
        navigationController?.navigationBar.isHidden = false
        title = "Photo Gallery"
        view.backgroundColor = .white
    }
    
    @objc private func setupGoToGalleryButton() {
                let photosViewController = PhotosViewController()
                navigationController?.pushViewController(photosViewController, animated: true)
            }
    
    private func layout() {
        view.addSubview(collectionViewCell)
        NSLayoutConstraint.activate([
            collectionViewCell.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionViewCell.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionViewCell.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionViewCell.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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
}
