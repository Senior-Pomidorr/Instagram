//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 11.02.2023.
//

import UIKit


class ProfileViewController: UIViewController {
    
    private var profilePosts = ProfilePosts.showPosts()
    private let headerView = ProfileHeaderView()
    private var indexPathCell = IndexPath()
    private var initialImageRect: CGRect = .zero
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register( PostTableViewCell.self, forCellReuseIdentifier:  PostTableViewCell.identifier)
        tableView.register( PhotosTableViewCell.self, forCellReuseIdentifier:  PhotosTableViewCell.identifier)
        return tableView
    }()
    
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
        button.backgroundColor = #colorLiteral(red: 0.9152029157, green: 0.9385595322, blue: 0.9381520152, alpha: 1)
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(closeAnimation), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        layoutTableView()
    }
    
    private func layoutTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func animateImage(_ image: UIImage?, imageFrame: CGRect) {
        view.addSubview(whiteView)
        view.addSubview(animatingImageView)
        animatingImageView.image = image
        animatingImageView.alpha = 1.0
        animatingImageView.frame = CGRect(x: imageFrame.origin.x,
                                          y: imageFrame.origin.y,
                                          width: imageFrame.width,
                                          height: imageFrame.height)
        
        UIView.animate(withDuration: 0.3) {
            self.animatingImageView.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            self.animatingImageView.center = self.view.center
            self.animatingImageView.layer.cornerRadius = 0
            self.navigationController?.navigationBar.isHidden = true
        } completion: { _ in
            self.view.addSubview(self.closeButton)
        }
    }
    
    @objc func closeAnimation() {
        closeButton.removeFromSuperview()
        whiteView.removeFromSuperview()
        
        UIView.animate(withDuration: 0.3) {
            self.animatingImageView.frame = self.initialImageRect
            self.animatingImageView.layer.cornerRadius = 50
            self.navigationController?.navigationBar.isHidden = false
        } completion: { _ in
            self.animatingImageView.removeFromSuperview()
        }
    }
}


extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profilePosts.count
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
        cell.button.addTarget(self, action: #selector(setupGoToGalleryButton), for: .touchUpInside)
        if indexPath.row == 0 {
            return cell
        }
        
        let cellPost = tableView.dequeueReusableCell(withIdentifier:  PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cellPost.setupCustomCell(with: indexPath)
        if indexPath.row == 1 {
        }
        return cellPost
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerView.myDelegate = self
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220
    }
    
    func tapAction() {
        let viewController = PhotosViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let viewController = PhotosViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            let showPostVC = ShowPostViewController(model: profilePosts[indexPath.row], indexPath: indexPath)
            present(showPostVC, animated: true)
            
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            profilePosts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @objc func setupGoToGalleryButton() {
        let viewController = PhotosViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ProfileViewController: HeaderDelegate {
    
    func tapImage(_ image: UIImage?, imageRect: CGRect) {
        let headerFrame = headerView.frame
        let currentHeaderView = tableView.convert(headerFrame, to: view)
        initialImageRect = CGRect(x: imageRect.origin.x,
                                  y: imageRect.origin.y + currentHeaderView.origin.y,
                                  width: imageRect.width,
                                  height: imageRect.height)
        
        animateImage(image, imageFrame: initialImageRect)
    }
}


