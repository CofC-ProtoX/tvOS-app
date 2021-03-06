//
//  WeekView.swift
//  tvOS-app
//
//  Created by Michael Edenzon on 2/16/18.
//  Copyright © 2018 Michael Edenzon. All rights reserved.
//

import UIKit

class WeekView: SlideView {
    
    let days: [String] = ["Monday","Tuesday","Wednesday","Thursday","Friday"]
    var dayViews: [DayView] = []

    init(frame: CGRect) {
        super.init(frame: frame.insetBy(dx: 50, dy: 50), title: "Weekly Hours")
        buildDisplay()
    }
    
    func buildDisplay() {
        let inset: CGFloat = 7.5
        let height = frame.height / 2
        let width = (frame.width / CGFloat(days.count))
        for i in 0..<days.count {
            let x = self.frame.width * (CGFloat(i) / CGFloat(days.count)) + inset
            let y = (self.frame.height / 2) - (height / 2)
            let frame = CGRect(x: x, y: y, width: width  - (inset * 2), height: height)
            dayViews.append(DayView(frame: frame, day: days[i]))
            self.addSubview(dayViews.last!)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
