//
//  UITabBarController.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 11.02.2023.
//

import UIKit

class UiTabBarController: UITabBarController {
    
    private let firstVC = UINavigationController(rootViewController: FeedViewController())
    private let thirdVC = UINavigationController(rootViewController: LogInViewController())
    private let secondVC = UINavigationController(rootViewController: MainFeedViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    private func setupControllers() {
        self.tabBar.backgroundColor = .white

        let image = UIImage(systemName: "house.fill")
        image?.withTintColor(.black)
        firstVC.tabBarItem.title = "Лента"
        firstVC.tabBarItem.image = image
        
        secondVC.tabBarItem.title = "MainFeed"
        secondVC.tabBarItem.image = image
        
        thirdVC.tabBarItem.title = "Профиль"
        thirdVC.tabBarItem.image = UIImage(systemName: "person.fill")
    
        viewControllers = [firstVC, secondVC, thirdVC]
        thirdVC.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}


