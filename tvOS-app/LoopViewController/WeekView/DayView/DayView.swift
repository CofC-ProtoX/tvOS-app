//
//  DayView.swift
//  tvOS-app
//
//  Created by Michael Edenzon on 2/16/18.
//  Copyright © 2018 Michael Edenzon. All rights reserved.
//

import UIKit

struct Scale {
    static let down = CGAffineTransform(scaleX: 1.05, y: 1.05)
    static let up   = CGAffineTransform(scaleX: 1.1, y: 1.1)
    static let zero = CGAffineTransform(scaleX: 1.0, y: 1.0)
}

class DayView: UIButton {
    
    var day: String = ""
    var titleView: DayTitleView!
    
    var backgroundView: UIView!
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        backgroundView.layer.cornerRadius = self.frame.width / 8
        backgroundView.isHidden = isFocused
        
        self.layer.cornerRadius = self.frame.width / 8
        self.addSubview(backgroundView)
    }
    
    
    convenience init(frame: CGRect, day: String) {
        self.init(frame: frame)
        self.day = day
        buildTitleView()
    }
    
    
    ///
    /// Builds TitleView and adds it as a subview.
    ///
    private func buildTitleView() {
        let titleFrame = CGRect(x: 0, y: 10, width: frame.width, height: frame.height / 10)
        titleView = DayTitleView(frame: titleFrame, title: day)
        self.addSubview(titleView)
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
            self.backgroundView.isHidden = true
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
            self.backgroundView.isHidden = false
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
