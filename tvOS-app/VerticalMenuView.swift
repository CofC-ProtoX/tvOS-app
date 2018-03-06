//
//  SideMenuView.swift
//  tvOS-app
//
//  Created by Michael Edenzon on 2/28/18.
//  Copyright © 2018 Michael Edenzon. All rights reserved.
//

import UIKit

extension UIView {
    func addDebuggingBorder() {
        self.layer.borderColor = UIColor.yellow.cgColor
        self.layer.borderWidth = 3
    }
    func addDebuggingBorder(with color: UIColor) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 3
    }
}

class VerticalMenuView: UIView {
    

    var effectView: UIVisualEffectView!
    var containerView: ButtonContainerView!

    init(frame: CGRect, inset: CGFloat) {
        super.init(frame: frame)
        self.frame = frame
        effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        effectView.frame = self.bounds
        containerView = ButtonContainerView(frame: CGRect(x: inset, y: inset, width: self.frame.width - inset * 2, height: self.frame.height - inset * 2))
        self.addSubview(effectView)
        self.addSubview(containerView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ButtonContainerView: UIView {
    
    var buttonCount = 5
    var buttons: [StandardButton] = []
    var frames: [CGRect] = []
    var titles: [String] = ["Button 1",
                            "Button 2",
                            "Button 3",
                            "Button 4",
                            "Button 5",]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addButtons()
    }
    
    func addFrames() {
        let height = (self.frame.height / CGFloat(buttonCount))
        guard buttonCount == titles.count else { return }
        for i in 0..<buttonCount {
            let y = (CGFloat(i) * height)
            let x = CGFloat(0)
            frames.append(CGRect(x: CGFloat(0), y: CGFloat(i *), width: self.frame.width, height: height))
        }
    }
    
    func addButtons() {
        
        for i in 0..frames.count {
            buttons.append(StandardButton(frame: frame.insetBy(dx: 0, dy: 10), title: titles[i]))
            self.addSubview(buttons.last!)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

