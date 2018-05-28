//
//  VerticalMenuContainerView.swift
//  tvOS-app
//
//  Created by Michael Edenzon on 3/7/18.
//  Copyright © 2018 Michael Edenzon. All rights reserved.
//

import UIKit

class VerticalMenuContainerView: UIView {
    
    var buttonCount = 5
    var buttons: [StandardButton] = []
    var frames:  [CGRect] = []
    var titles:  [String] = ["Button 1","Button 2","Button 3","Button 4","Button 5",]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addFrames()
        addButtons()
    }
    
    func addFrames() {
        let width  = frame.width
        let height = frame.height / buttonCount.cgf
        for i in 0..<buttonCount {
            frames.append(CGRect(x: 0.cgf, y: i.cgf * height, width: width, height: height))
        }
    }
    
    func addButtons() {
        if frames.count == titles.count {
            for i in 1..<frames.count {
                buttons.append(StandardButton(frame: frames[i].insetBy(dx: 0, dy: 10), title: titles[i]))
                self.addSubview(buttons.last!)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
