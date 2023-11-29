
//  MainFeed.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 03.11.2023.
//

import UIKit
import Kingfisher

final class MainFeedViewController: UIViewController {
    var pagination = false
    
    private var likes = [SearchResults]()
    private var posts: [FeedPhotos] = [] {
        didSet {
            return mainTableView.reloadData()
        }
    }
    private var networkDataFetcher = NetworkDataFetcher()
    
    private lazy var mainTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.separatorStyle = .none
        table.allowsSelection = false
        table.dataSource = self
        table.delegate = self
        table.register(MainFeedCell.self, forCellReuseIdentifier: MainFeedCell.identifier)
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

extension MainFeedViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainFeedCell.identifier, for: indexPath) as! MainFeedCell
        cell.configureMainFeed(posts, indexPath: indexPath)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
        if indexPath.row == posts.count - 5 && !pagination {
            pagination = true
            Task(priority: .background) {
                do {
                    let morePosts = try await networkDataFetcher.fetchFeedPosts()
                    self.posts.append(contentsOf: morePosts)
                } catch {
                    print("Error fetching on pagination")
                }
                pagination = false
            }
        }
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
