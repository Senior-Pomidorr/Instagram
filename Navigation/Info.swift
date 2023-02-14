//
//  ViewController.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 14.02.2023.
//

import UIKit

class Info: UIViewController {
    
    
    private lazy var button = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 220, height: 60))
        button.setTitle("Alert Action", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 16
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        setupButton()
        // Do any additional setup after loading the view.
    }
    
    private func setupButton() {
        view.addSubview(button)
        button.center = view.center
        button.addTarget(self, action: #selector(UIAlertAction), for: .touchUpInside)
    }
    
    @objc private func UIAlertAction() {
        let alert = UIAlertController(title: "That was be text", message: "About application", preferredStyle: .alert)
        alert.addAction(UIKit.UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
        print("Touch UIAlert Action")
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
