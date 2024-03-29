//
//  SearchPhotosVC.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 10.11.2023.
//

import UIKit

final class SearchPhotosViewController: UICollectionViewController, UISearchControllerDelegate {
    
    private var networkDataFetcher = NetworkDataFetcher()
    private var timer: Timer?
    private let itemsPerRow: CGFloat = 2
    private let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    private var selectedImages = [UIImage]()
    private var pagination = false
    private var searchTextCopy = String()
    
    private var photos: [UnsplashPhoto] = [] {
        didSet {
            return self.collectionView.reloadData()
        }
    }
    
    private lazy var addBarButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped))
    }()
    
    private lazy var actionBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(actionBarButtonTapped))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupSearchBar()
        setupNavigationBar()
        
    }
    
    //MARK: - NavigationItems action
    
    @objc func addBarButtonTapped() {
        print(#function)
    }
    
    @objc func actionBarButtonTapped() {
        print(#function)
        let shareController = UIActivityViewController(activityItems: selectedImages, applicationActivities: nil)
        present(shareController, animated: true)
    }
    
    private func setupCollectionView() {
        collectionView.register(PhotosSearchCell.self, forCellWithReuseIdentifier: PhotosSearchCell.identifier)
        collectionView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.contentInsetAdjustmentBehavior = .automatic
    }
    
    
    //MARK: - Setup NavigationBar
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "PHOTOS"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = .gray
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        navigationItem.rightBarButtonItems = [actionBarButtonItem, addBarButton]
        navigationController?.navigationBar.tintColor = .black
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.hidesBarsOnSwipe = true
    }
    
    private func setupSearchBar() {
        let searchController = UISearchController()
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
    }
    
    //MARK: - UICollectionViewDataSource, UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosSearchCell.identifier, for: indexPath) as! PhotosSearchCell
        let photos = photos[indexPath.item]
        cell.unsplashPhoto = photos
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! PhotosSearchCell
        guard let image = cell.photoImage.image else { return }
        selectedImages.append(image)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! PhotosSearchCell
        guard let image = cell.photoImage.image else { return }
        if let index = selectedImages.firstIndex(of: image) {
            selectedImages.remove(at: index)
        }
    }
}

// MARK: - UISearchBarDelegate
extension SearchPhotosViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            Task {
             let searchData = try await self.networkDataFetcher.fetchSearchPosts(searchTerm: searchText)
                self.photos = searchData.results
                self.searchTextCopy = searchText
            }
        })
    }
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == photos.count - 1 && !pagination {
            pagination = true
            Task(priority: .background) {
                do {
                    let morePosts = try await networkDataFetcher.fetchSearchPosts(searchTerm: searchTextCopy)
                    self.photos.append(contentsOf: morePosts.results)
                    pagination = false
                } catch {
                    print("Error fetching on pagination")
                }
            }
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SearchPhotosViewController: UICollectionViewDelegateFlowLayout{
    
    private var sideInset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = itemWidth(for: collectionView.frame.width, spacing: 0)
        return CGSize(width: width, height: width)
    }
    
    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let totalSpasing: CGFloat = 4 * spacing + (4 - 3) * spacing
        let finalWidth = (width - totalSpasing) / 3.2
        return finalWidth
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}

