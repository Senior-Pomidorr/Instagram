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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    private func setupControllers() {
        self.tabBar.backgroundColor = .white

        firstVC.tabBarItem.title = "Лента"
        firstVC.tabBarItem.image = UIImage(systemName: "house.fill")
        
        thirdVC.tabBarItem.title = "Профиль"
        thirdVC.tabBarItem.image = UIImage(systemName: "person.fill")
    
        viewControllers = [firstVC, thirdVC]
        thirdVC.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}


