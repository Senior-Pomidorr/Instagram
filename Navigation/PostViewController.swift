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
        // Do any additional setup after loading the view.
    }

    private func setupButtonInfo() {
        let button = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(actionTabInfo))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc private func actionTabInfo() {
        var info = Info()
        info.title = "Info"
        present(info, animated: true)
    }

    struct Post {
        var title: String
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
