//
//  Extensions.swift
//  tvOS-app
//
//  Created by Michael Edenzon on 3/7/18.
//  Copyright © 2018 Michael Edenzon. All rights reserved.
//

import UIKit

extension Int {
    var cgf: CGFloat {
        get {
            return CGFloat(self)
        }
    }
}

extension UIView {
    func addDebuggingOutline() {
        self.layer.borderColor = UIColor.yellow.cgColor
        self.layer.borderWidth = 3
    }
    func addDebuggingOutline(with color: UIColor) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 3
    }
}
