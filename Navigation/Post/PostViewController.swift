//
//  PostViewController.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 12.02.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    private let infoButton = UITabBarItem()
    private lazy var buttonInfo = {
        let button = UIButton(frame: CGRect(x: 100, y: 150, width: 220, height: 60))
        button.setTitle("Info", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 16
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        self.navigationItem.title = "Your Post"
        setupButtonInfo()
    }
    
    private func setupButtonInfo() {
        let button = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(actionTabInfo))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc private func actionTabInfo() {
        let info = Info()
        info.title = "Info"
        present(info, animated: true)
    }
}
