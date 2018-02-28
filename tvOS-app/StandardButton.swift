//
//  Button.swift
//  tvOS-app
//
//  Created by Michael Edenzon on 2/15/18.
//  Copyright © 2018 Michael Edenzon. All rights reserved.
//

import UIKit

class StandardButton: UIButton {
    
    let gradientLayer = CAGradientLayer()
    
    
    
    override func awakeFromNib() {
        format()
    }
    
    func format() {
        self.titleLabel?.textColor = UIColor.white
        self.titleLabel?.shadowColor = UIColor.black
        self.titleLabel?.shadowOffset = CGSize(width: 0, height: 0)
        
        let color1 = UIColor(red: 255/255, green: 206/255, blue: 85/255, alpha: 1.0).cgColor
        let color2 = UIColor(red: 210/255, green: 152/255, blue: 12/255, alpha: 1.0).cgColor
        
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [color1, color2]
        gradientLayer.locations = [0.0, 1.0]
        
        self.layer.addSublayer(gradientLayer)
        self.layer.cornerRadius = self.frame.height / 8
        
        self.tintColor = UIColor.black.withAlphaComponent(0.03)
        
        self.addSubview(titleLabel!)
    }

}
