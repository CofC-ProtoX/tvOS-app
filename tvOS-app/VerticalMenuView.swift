//
//  SideMenuView.swift
//  tvOS-app
//
//  Created by Michael Edenzon on 2/28/18.
//  Copyright © 2018 Michael Edenzon. All rights reserved.
//

import UIKit

class VerticalMenuView: UIView {
    
    var effectView: UIVisualEffectView!
    var containerView: VerticalMenuContainerView!
    
    init(frame: CGRect, inset: CGFloat) {
        super.init(frame: frame)
        addVisualEffectView()
        addContainer(inset: inset)
    }
    
    func addVisualEffectView() {
        effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        effectView.frame = self.bounds
        self.addSubview(effectView)
    }
    
    func addContainer(inset: CGFloat) {
        let origin = CGPoint(x: inset, y: inset)
        let size = CGSize(width: frame.width - (inset * 2), height: frame.height - (inset * 2))
        let containerFrame = CGRect(origin: origin, size: size)
        containerView = VerticalMenuContainerView(frame: containerFrame)
        self.addSubview(containerView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
