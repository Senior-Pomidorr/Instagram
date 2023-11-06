
//  MainFeed.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 03.11.2023.
//

import UIKit

final class MainFeedViewController: UIViewController{

    var posts: [Posts] = [] {
        didSet {
            mainTableView.reloadData()
        }
    }
    
    private lazy var mainTableView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let table = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        table.dataSource = self
        table.delegate = self
        table.register(MainFeedCell.self, forCellWithReuseIdentifier: MainFeedCell.identifier)
        return table.autoLayout()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        layoutTableView()
        NetworkService.network.getPosts { [weak self] (posts) in
            DispatchQueue.main.async {
                self?.posts = posts
            }
        }
    }
    
    private func layoutTableView() {
        view.addSubview(mainTableView)
        
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
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
        cell.configure(posts[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 575)
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
