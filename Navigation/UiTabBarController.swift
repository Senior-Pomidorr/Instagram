//
//  UITabBarController.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 11.02.2023.
//

import UIKit

class UiTabBarController: UITabBarController {
    
    private let firstVC = UINavigationController(rootViewController: FeedViewController())
    private let secondVC = UINavigationController(rootViewController: ProfileViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    private func setupControllers() {
        self.tabBar.backgroundColor = .white
        firstVC.tabBarItem.title = "Лента"
        firstVC.tabBarItem.image = UIImage(systemName: "house.fill")
    
        secondVC.tabBarItem.title = "Профиль"
        secondVC.tabBarItem.image = UIImage(systemName: "person.fill")
        
        viewControllers = [firstVC, secondVC]
        
    }
}


