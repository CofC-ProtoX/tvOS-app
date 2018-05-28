//
//  ViewController.swift
//  tvOS-app
//
//  Created by Michael Edenzon on 2/15/18.
//  Copyright © 2018 Michael Edenzon. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menuWidth = view.frame.width / 4
        let menuHeight = view.frame.height
        view.addSubview(VerticalMenuView(frame: CGRect(x: 0, y: 0, width: menuWidth, height: menuHeight), inset: 30))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

