
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
    
    //MARK: - Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutTableView()
        customNavigationBar()
        Task {
            await fetchData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.hidesBarsOnSwipe = true
//    let startindex = posts.count.words.startIndex
//        if indexPath.row == startindex, startindex == 0 {
//            navigationController?.hidesBarsOnSwipe = false
//        } else {
//            navigationController?.hidesBarsOnSwipe = true
//        }
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
    
    //MARK: - CustomNavigationBar
    private func customNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = customTitleBar(image: "InstagramLogo")
        navigationItem.rightBarButtonItems = [createCustomButton(imageName: "Messanger", selector: #selector(tapOnMessage)),  createCustomButton(imageName: "heart", selector: #selector(tapOnLike))]
        navigationController?.navigationBar.backgroundColor = .white
    }
    
    private func customTitleBar(image: String) -> UIBarButtonItem {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 140, height: 41)
        
        let imageLogo = UIImageView()
        imageLogo.image = UIImage(named: image)
        imageLogo.contentMode = .scaleAspectFill
        imageLogo.frame = CGRect(x: 10, y: 5, width: 105, height: 34)
        view.addSubview(imageLogo)
        
        let menuTabBarItem = UIBarButtonItem(customView: view)
        return menuTabBarItem
    }
    
    private func createCustomButton(imageName: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        let image = UIImage(named: imageName)
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.imageView?.contentMode = .scaleAspectFill
//        button.contentVerticalAlignment = .fill
//        button.contentHorizontalAlignment = .fill
        button.frame = CGRect(x: 0, y: 5, width: 24, height: 34)
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuTabBarItem = UIBarButtonItem(customView: button)
        return menuTabBarItem
    }
    
    @objc func tapOnLike() {
        print(#function)
    }
    
    @objc func tapOnMessage() {
        print(#function)
    }
    
    // MARK: - Layout
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

// MARK: - UITableViewDelegate, UITableViewDataSource
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

//MARK: - Extension
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
