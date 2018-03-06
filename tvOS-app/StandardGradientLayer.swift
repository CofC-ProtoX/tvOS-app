//
//  StandardGradientLayer.swift
//  tvOS-app
//
//  Created by Michael Edenzon on 2/28/18.
//  Copyright © 2018 Michael Edenzon. All rights reserved.
//

import UIKit

class StandardGradientLayer: CAGradientLayer {
    
    init(frame: CGRect) {
        super.init()
        self.frame = frame
        self.colors = [UIColor(red: 255/255, green: 206/255, blue: 85/255, alpha: 1.0).cgColor,
                       UIColor(red: 210/255, green: 152/255, blue: 12/255, alpha: 1.0).cgColor]
        self.locations = [0.0, 1.0]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
