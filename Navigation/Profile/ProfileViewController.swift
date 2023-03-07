//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 11.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private var profilePosts = ProfilePosts.showPosts()
    private let profileView = ProfileHeaderView()
    private let photos = photoCels
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register( PostTableViewCell.self, forCellReuseIdentifier:  PostTableViewCell.identifier)
        tableView.register( PhotosTableViewCell.self, forCellReuseIdentifier:  PhotosTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.backgroundColor = .white
        loyoutTableView()
    }
    
    
    private func loyoutTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profilePosts.count
    }
    
    private func numberOfSections(in tableView: UICollectionView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier:  PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.button.addTarget(self, action: #selector(setupGoToGalleryButton), for: .touchUpInside)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier:  PostTableViewCell.identifier, for: indexPath) as!  PostTableViewCell
        cell.setupCell(model: profilePosts[indexPath.item])
        return cell
    }
    
    @objc private func setupGoToGalleryButton() {
        let photosVC = PhotosViewController()
        navigationController?.pushViewController(photosVC, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        let header = ProfileHeaderView()
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            let viewController = PhotosViewController()
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
