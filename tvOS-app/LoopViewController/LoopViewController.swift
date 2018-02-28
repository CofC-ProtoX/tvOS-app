
//
//  LoopViewController.swift
//  tvOS-app
//
//  Created by Michael Edenzon on 2/16/18.
//  Copyright © 2018 Michael Edenzon. All rights reserved.
//

import UIKit


class LoopViewController: UIViewController {
    
    var slides: [SlideView] = []
    
    var animationCurve: UIViewAnimationOptions {
        get {
            return UIViewAnimationOptions.curveEaseOut
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _1 = SlideView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), title: "#1")
        let _2 = SlideView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), title: "#2")
        
        add(slide: _1)//WeekView(frame: view.frame))
        add(slide: _2)//WeekView(frame: view.frame))
        
        view.addSubview(_1)
        transition()
    }
    
    
    
    ///
    /// Adds a new slide to the superview.
    ///
    private func add(slide: SlideView) {
        slides.append(slide)
    }
    
    
    
    ///
    /// Rotates completed slide from front of queue to back of queue.
    ///
    private func rotate() {
        if slides.count > 1 {
            slides.append(slides.remove(at: 0))
        }
    }
    
    
    
    ///
    /// Performs slide in & slide out animations.
    ///
    func transition() {
        rotate()
        view.addSubview(slides[0])
        slides[0].slideIn()
        slides[1].slideOut()
        
        UIView.animate(withDuration: 3, delay: 0.25, options: animationCurve, animations: {
            let width = self.view.frame.width
            let height = self.view.frame.height
            self.slides[0].frame = CGRect(x: 0, y: 0, width: width, height: height)
            self.slides[1].frame = CGRect(x: 0 - (width + 5), y: 0, width: width, height: height)
        })
    }
    
    
    
    ///
    /// Dispose of any resources that can be recreated.
    ///
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        for slide in slides {
            slide.removeFromSuperview()
        }
        slides = []
    }
}
