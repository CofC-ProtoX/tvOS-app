//
//  Elastic.swift
//  tvOS-app
//
//  Created by Michael Edenzon on 2/19/18.
//  Copyright © 2018 Michael Edenzon. All rights reserved.
//

import Foundation
import UIKit

class Elastic {
    
    ///
    /// Returns distance between two points.
    ///
    /// - Parameters:
    ///   - from: First point.
    ///   - to: Second point
    ///
    private static func distance(from p1: CGPoint, to p2: CGPoint) -> CGFloat {
        return abs(p2.x - p1.x) + abs(p2.y - p1.y)
    }
    
    ///
    /// Returns "elastic point" based on touch point.
    ///
    /// - Parameters:
    ///   - from: First touch point
    ///   - to: Current touch point
    ///
    static func point(from p1: CGPoint, to p2: CGPoint) -> CGPoint {
        let dx = p2.x - p1.x
        let dy = p2.y - p1.y
        
        let sx = copysign(1, dx)
        let sy = copysign(1, dy)
        
        let d = distance(from: p1, to: p2)
        let ld = log(d)// + (d/1.3)
        
        let px = ((abs(dx) / d) * ld) * sx
        let py = ((abs(dy) / d) * ld) * sy
        
        return CGPoint(x: p1.x + px, y: p1.y + py)
    }
    
    
}
