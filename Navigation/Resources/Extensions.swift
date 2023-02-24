//
//  Extensions.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 21.02.2023.
//

import UIKit

enum Picture {
    static var picturePhoto = UIImage(named: "kanye west")
    static var logo = UIImage(named: "logo")
    static var bluePixel = UIImage(named: "blue_pixel")
}

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}
