//
//  Content.swift
//  tvOS-app
//
//  Created by Michael Edenzon on 2/16/18.
//  Copyright © 2018 Michael Edenzon. All rights reserved.
//

import Foundation
import UIKit

enum Days {
    case Monday, Tuesday, Wednesday, Thursday, Friday
}

class Mentor {
    
    var name: String!
    var image: UIImage?
    var schedule: [Days] = []
    
    init(name: String) {
        self.name = name
    }
    
    convenience init(name: String, image: UIImage) {
        self.init(name: name)
        self.image = image
    }
}
