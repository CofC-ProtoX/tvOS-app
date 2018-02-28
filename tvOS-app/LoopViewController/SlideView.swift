//
//  SlideView.swift
//  tvOS-app
//
//  Created by Michael Edenzon on 2/21/18.
//  Copyright © 2018 Michael Edenzon. All rights reserved.
//

import UIKit

class SlideView: UIView {
    
    var title: String = ""
    var titleLabel: UILabel!
    var animationCurve: UIViewAnimationOptions {
        get {
            return UIViewAnimationOptions.curveEaseOut
        }
    }
    
    enum position {
        case inward, outward
    }
    
    
    
    ///
    /// Initializer method – accepts a frame as a CGRect and title as a String.
    ///
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        self.title = title
        self.backgroundColor = UIColor.red.withAlphaComponent(0.5)
    }
    
    
    
    ///
    /// Creates title as UILabel and adds it as a subview.
    ///
    func buildTitle() {
        let x = CGFloat(0.0)
        let y = frame.height * (1/10)
        let width = frame.width
        let height = frame.height * (1/5)
        titleLabel = UILabel(frame: CGRect(x: x, y: y, width: width, height: height))
        self.addSubview(titleLabel)
    }
    
    
    
    ///
    /// Sets the view's frame based on the given position.
    ///
    func move(_ position: position) {
        let size = (self.superview?.frame.size)!
        switch position {
        case .inward:
            self.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        case .outward:
            self.frame = CGRect(origin: CGPoint(x: -size.width - 1, y: 0), size: size)
        }
    }
    
    
    
    ///
    /// Animates the SlideView's inward transition.
    ///
    func slideIn() {
        UIView.animate(withDuration: 3, delay: 0.25, options: animationCurve, animations: {
            self.move(.inward)
        })
    }
    
    
    
    ///
    /// Animates the SlideView's outward transition.
    ///
    func slideOut() {
        UIView.animate(withDuration: 3, delay: 0, options: animationCurve, animations: {
            self.move(.outward)
        }) { (true) in
            self.removeFromSuperview()
        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
