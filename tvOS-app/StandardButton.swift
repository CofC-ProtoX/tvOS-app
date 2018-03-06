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
    var title: String!
    var label: UILabel!
    var radius: CGFloat!
    
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        self.radius = self.frame.height / 8
        gradientLayer = StandardGradientLayer(frame: self.bounds)
        gradientLayer.cornerRadius = self.radius
        self.layer.addSublayer(gradientLayer)
        self.tintColor = UIColor.black.withAlphaComponent(0.03)
        self.layer.cornerRadius = self.radius
        self.title = title
        self.addTitleLabel()
    }
    
    func addTitleLabel() {
        label = UILabel(frame: bounds)
        label.text = title
        label.textColor = UIColor.white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 2.5
        label.layer.shadowOffset = CGSize.zero
        label.layer.shadowOpacity = 0.5
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        addSubview(label)
    }
    
    ///
    ///
    ///
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        guard presses.count == 1 else { return }
        for press in presses {
            if press.type == .select {
                pressDown()
            }
        }
    }
    
    
    ///
    ///
    ///
    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        guard presses.count == 1 else { return }
        for press in presses {
            if press.type == .select {
                pressUp()
            }
        }
    }
    
    
    ///
    ///
    ///
    override func pressesCancelled(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        guard presses.count == 1 else { return }
        for press in presses {
            if press.type == .select {
                pressUp()
            }
        }
    }
    
    
    ///
    /// Formatting for when view is in focus.
    ///
    func highlight() {
        UIView.animate(withDuration: 0.075) {
            UIView.setAnimationCurve(UIViewAnimationCurve.easeOut)
            self.transform = Scale.up
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 10, height: 10)
            self.layer.shadowOpacity = 0.25
            self.layer.shadowRadius = 5.0
            self.superview?.bringSubview(toFront: self)
            //self.backgroundView.isHidden = true
        }
    }
    
    
    ///
    /// Formatting for when view is no longer in focus.
    ///
    func removeHighlight() {
        UIView.animate(withDuration: 0.025) {
            UIView.setAnimationCurve(UIViewAnimationCurve.easeIn)
            self.transform = Scale.zero
            self.layer.shadowRadius = 0.0
            self.layer.shadowOpacity = 0.0
            //self.backgroundView.isHidden = false
        }
    }
    
    
    ///
    /// Formats for click event.
    ///
    func pressDown() {
        self.transform = Scale.down
    }
    
    
    ///
    /// Formats for end or cancellation of click event.
    ///
    func pressUp() {
        self.transform = Scale.up
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
