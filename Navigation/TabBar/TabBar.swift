//
//  UITabBarController.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 11.02.2023.
//

import UIKit

final class UiTabBarController: UITabBarController {
    
//    private let firstVC = UINavigationController(rootViewController: FeedViewController()) 

    override func viewDidLoad() {
        super.viewDidLoad()
          self.tabBar.backgroundColor = .white
        viewControllers = [
            generateNavigationController(
                rootViewController: MainFeedViewController(),
                title: "Main",
                image: UIImage(
                    named: "main"
                )!
            ),
            generateNavigationController(
                rootViewController: SearchPhotosViewController(collectionViewLayout: UICollectionViewFlowLayout()),
                title: "Search",
                image: UIImage(
                    systemName: "magnifyingglass"
                )!
            ),
            generateNavigationController(
                rootViewController: LogInViewController(),
                title: "Profile",
                image: UIImage(
                    systemName: "person.fill"
                )!
            )
        ]
    }
    
    //MARK: - Setup ViewControllers
    private func generateNavigationController(rootViewController: UIViewController, title: String?, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}


