//
//  Sine.swift
//  Sine Wave
//
//  Created by mitchell hudson on 2/24/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import Foundation
import UIKit

class Sine {
    var radius: Double!
    var frequency: Double!
    var phase: Double = 0
    
    func step() {
        phase += frequency
    }
    
    init(frequency: Double, radius: Double) {
        self.frequency = frequency
        self.radius = radius
    }
}