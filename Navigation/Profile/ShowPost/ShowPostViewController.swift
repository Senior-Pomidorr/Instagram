//
//  ShowPostViewController.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 01.04.2023.
//

import UIKit

class ShowPostViewController: UIViewController {
    
    private var showPostView = ShowPostView()
    private let model: ProfilePosts
    private var indexPath: IndexPath
    
    init( model: ProfilePosts, indexPath: IndexPath) {
        self.model = model
        self.indexPath = indexPath
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = showPostView
        showPostView.setupView(model: model)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
