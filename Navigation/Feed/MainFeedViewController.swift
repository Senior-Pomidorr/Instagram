
//  MainFeed.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 03.11.2023.
//

import UIKit
import Kingfisher

final class MainFeedViewController: UIViewController {
    private var likes = [SearchResults]()
    private var posts: [FeedPhotos] = [] {
        didSet {
            return self.mainTableView.reloadData()
        }
    }
    private var networkDataFetcher = NetworkDataFetcher()
    
    private lazy var mainTableView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let table = UICollectionView(frame: .zero, collectionViewLayout: layout)
        table.dataSource = self
        table.delegate = self
        table.register(MainFeedCell.self, forCellWithReuseIdentifier: MainFeedCell.identifier)
        return table.autoLayout()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutTableView()
        Task {
            await fetchData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.title = "Instagram"
    }
    
    private func fetchData() async {
            do {
                let fetchedImages = try await networkDataFetcher.fetchFeedPosts()
                self.posts = fetchedImages
//                print("Fetched images: \(fetchedImages)")
            } catch {
                print("Error fetching or decoding images: \(error.localizedDescription)")
            }
    }
    
    private func layoutTableView() {
        view.addSubview(mainTableView)
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MainFeedViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainFeedCell.identifier, for: indexPath) as! MainFeedCell
        cell.configureMainFeed(posts, indexPath: indexPath)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 538)
    }
   
}

extension MainFeedViewController: mainViewCellDelagate {
    
    func tapLikeButton() {
        print("tap like")
    }
    
    func tapComment() {
        print("tap comment")
    }
    
    func tapMessage() {
        print("tap message")
    }
    
    func tapBookmark() {
        print("tap bookmark")
    }
}
