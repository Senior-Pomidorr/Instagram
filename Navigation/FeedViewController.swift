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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = textForLabel
        setupButton()
        setupButtonTwo()
        loyout()
    }
    
    
    private func setupButton() {
        view.addSubview(buttonOne)
        buttonOne.addTarget(self, action: #selector(actionTab), for: .touchUpInside)
    }
    
    private func setupButtonTwo() {
        view.addSubview(buttonTwo)
        buttonTwo.addTarget(self, action: #selector(actionTab), for: .touchUpInside)
    }
    
    @objc private func actionTab() {
        let postViewCobtroller = PostViewController()
        navigationController?.pushViewController(postViewCobtroller, animated: true)
        print("Touch Button")
    }
    
    private let stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .fillEqually
        return $0
    }(UIStackView())
    
    private let buttonOne: UIButton = {
        let button = UIButton()
        button.setTitle("Переход на пост", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 16
        return button
    }()
    
    private let buttonTwo: UIButton = {
        let button = UIButton()
        button.setTitle("Переход на пост", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 16
        return button
    }()
    
    private let myLabel: UILabel = {
        let myLabel = UILabel(frame: CGRect(x: 20, y: 150, width: 20, height: 40))
        return myLabel
    } ()
    
    
    private func loyout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -100),    
        ])
    }
    
    init(textForLabel: String? = nil) {
        self.textForLabel = textForLabel
        super.init(nibName: nil, bundle: nil)
        myLabel.text = textForLabel
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
