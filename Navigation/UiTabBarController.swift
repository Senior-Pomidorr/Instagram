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
    private let thirdVC = UINavigationController(rootViewController: PostViewController())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
   
    
    private func setupControllers() {
        self.tabBar.backgroundColor = .white
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.navigationBar.barTintColor = .cyan
//        self.navigationController?.navigationBar.tintColor = .white

        firstVC.tabBarItem.title = "Лента"
        firstVC.tabBarItem.image = UIImage(systemName: "house.fill")
        
        secondVC.tabBarItem.title = "Профиль"
        secondVC.tabBarItem.image = UIImage(systemName: "person.fill")
        
        thirdVC.tabBarItem.title = "Post"
        secondVC.tabBarItem.image = UIImage(systemName: "square.and.pencil")
        
        
        viewControllers = [firstVC, secondVC]
    
    }
    
}


