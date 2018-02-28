//
//  DayTitleView.swift
//  tvOS-app
//
//  Created by Michael Edenzon on 2/21/18.
//  Copyright © 2018 Michael Edenzon. All rights reserved.
//

import Foundation
import UIKit

class DayTitleView: UIView {
    
    var title: UILabel!
    
    init(frame: CGRect, title text: String) {
        super.init(frame: frame)
        setupTitle(frame: self.frame, title: text)
        self.addSubview(self.title)
    }
    
    private func setupTitle(frame: CGRect, title text: String) {
        self.title = UILabel(frame: frame)
        self.title.textColor = UIColor.white
        self.title.textAlignment = .center
        self.title.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
