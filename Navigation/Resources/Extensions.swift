//
//  Extensions.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 21.02.2023.
//

import UIKit

enum Picture {
    static var picturePhoto = UIImage(named: "16")
    static var logo = UIImage(named: "logo")
    static var bluePixel = UIImage(named: "blue_pixel")
}

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}

extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}
