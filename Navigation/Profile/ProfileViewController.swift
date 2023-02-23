//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 11.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private let profileView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        buttonTarget()
        
       
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileView.frame = view.frame
        view.addSubview(profileView)
    }
    
 

    func buttonTarget() {
        profileView.button().addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    }
    
    @objc func actionButton() {
        print("Статус")
    }
    
    

}


    
