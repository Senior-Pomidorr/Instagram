//
//  FeedViewController.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 11.02.2023.
//

import UIKit

final class FeedViewController: UIViewController {
    
    private var textForLabel: String?
    
    private let feedViewButton = UITabBarItem()
    private lazy var button = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 220, height: 60))
        button.setTitle("Переход на пост", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 16
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupButton()
        title = textForLabel
        // Do any additional setup after loading the view.
    }
    
    private func setupButton() {
        view.addSubview(button)
        button.center = view.center
        button.addTarget(self, action: #selector(actionTab), for: .touchUpInside)
    }
    
    @objc private func actionTab() {
        let postViewCobtroller = PostViewController()
        navigationController?.pushViewController(postViewCobtroller, animated: true)
        print("Touch Button")
    }
    
    
    
    private let myLabel: UILabel = {
        let myLabel = UILabel(frame: CGRect(x: 20, y: 150, width: 20, height: 40))
        return myLabel
    } ()
    
    init(textForLabel: String? = nil) {
        self.textForLabel = textForLabel
        super.init(nibName: nil, bundle: nil)
        myLabel.text = textForLabel
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
