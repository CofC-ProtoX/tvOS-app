//
//  Button.swift
//  tvOS-app
//
//  Created by Michael Edenzon on 2/15/18.
//  Copyright © 2018 Michael Edenzon. All rights reserved.
//

import UIKit

class StandardButton: UIButton {
    
    var gradientLayer: StandardGradientLayer!
    var radius: CGFloat!
    
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        self.radius = self.frame.height / 8
        gradientLayer = StandardGradientLayer(frame: self.bounds)
        gradientLayer.cornerRadius = self.radius
        self.layer.addSublayer(gradientLayer)
        self.tintColor = UIColor.black.withAlphaComponent(0.03)
        self.layer.cornerRadius = self.radius
        self.addTitleLabel(with: title)
    }
    
//    override func awakeFromNib() {
//        self.layer.addSublayer(StandardGradientLayer(frame: self.bounds))
//        self.tintColor = UIColor.black.withAlphaComponent(0.03)
//        self.layer.cornerRadius = self.frame.height / 8
//        self.titleLabel?.frame = self.bounds
//        self.titleLabel?.text = ""
//        self.titleLabel?.textColor = UIColor.white
//        self.titleLabel?.shadowColor = UIColor.black
//        self.titleLabel?.shadowOffset = CGSize(width: 0, height: 0)
//    }
    
    func addTitleLabel(with title: String) {
        self.titleLabel?.frame = self.bounds
        self.titleLabel?.text = title
        self.titleLabel?.textColor = UIColor.white
        self.titleLabel?.shadowColor = UIColor.black
        self.titleLabel?.shadowOffset = CGSize(width: 0, height: 0)
        self.addSubview(titleLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
