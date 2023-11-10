//
//  UITabBarController.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 11.02.2023.
//

import UIKit

class UiTabBarController: UITabBarController {
    
//    private let firstVC = UINavigationController(rootViewController: FeedViewController())
    private let firstVC = LogInViewController()
    private var searchViewLayout = SearchPhotosViewController(collectionViewLayout: UICollectionViewLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [
            generateNavigationController(
                rootViewController: MainFeedViewController(),
                title: "Main",
                image: UIImage(
                    named: "main"
                )!
            ),
            generateNavigationController(
                rootViewController: searchViewLayout,
                title: "Search",
                image: UIImage(
                    systemName: "magnifyingglass"
                )!
            ),
            generateNavigationController(
                rootViewController: firstVC,
                title: "Profile",
                image: UIImage(
                    systemName: "person.fill"
                )!
            )
        ]
//        firstVC.navigationController?.setNavigationBarHidden(true, animated: true)
          self.tabBar.backgroundColor = .white
    }
   
    
    //MARK: - Setup ViewControllers
    private func generateNavigationController(rootViewController: UIViewController, title: String?, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}


