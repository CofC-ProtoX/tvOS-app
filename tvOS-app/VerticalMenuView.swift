//
//  SideMenuView.swift
//  tvOS-app
//
//  Created by Michael Edenzon on 2/28/18.
//  Copyright © 2018 Michael Edenzon. All rights reserved.
//

import UIKit

class VerticalMenuWrapper: UIVisualEffectView {
    
    override init(effect: UIVisualEffect?) {
        super.init(effect: effect)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VerticalMenuView: UIView {
    
    var buttonCount = 5
    var buttons: [StandardButton] = []
    var titles: [String] = ["Button 1",
                            "Button 2",
                            "Button 3",
                            "Button 4",
                            "Button 5",]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addButtons()
    }
    
    func addButtons() {
        let spacing = (self.frame.height / CGFloat(buttonCount))
        let margin: CGFloat = 10
        guard buttonCount == titles.count else { return }
        for i in 0..<buttonCount {
            let y = (CGFloat(i) * spacing)
            let x = CGFloat(0)
            let frame = CGRect(x: x, y: y, width: self.frame.width, height: self.frame.height / CGFloat(buttonCount))
            buttons.append(StandardButton(frame: frame.insetBy(dx: 10, dy: 10), title: titles[i]))
            self.addSubview(buttons.last!)
            print(buttons.last?.frame.origin)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
