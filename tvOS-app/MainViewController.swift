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
        let menuFrame = CGRect(x: 0, y: 0, width: view.frame.width / 4, height: view.frame.height).insetBy(dx: 30, dy: 30)
        view.addSubview(VerticalMenuView(frame: menuFrame))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

