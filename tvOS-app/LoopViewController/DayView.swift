//
//  DayView.swift
//  tvOS-app
//
//  Created by Michael Edenzon on 2/16/18.
//  Copyright © 2018 Michael Edenzon. All rights reserved.
//

import UIKit

class DayView: UIButton {
    
    var day: String = ""
    var _highlighted = false
    
    var originalFrame: CGRect!
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        self.originalFrame = frame
        self.layer.cornerRadius = self.frame.width / 8
        self.backgroundColor = UIColor.white
//        self.layer.borderColor = UIColor.darkGray.cgColor
//        self.layer.borderWidth = 5
    }
    
    convenience init(frame: CGRect, day: String) {
        self.init(frame: frame)
        self.day = day
    }
    
    func highlight() {
        self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5.0
        self.superview?.bringSubview(toFront: self)
    }
    
    func removeHighlight() {
        self.transform = CGAffineTransform(scaleX: 1, y: 1)
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 0.25
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if context.nextFocusedView == self {
            highlight()
        } else {
            removeHighlight()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
