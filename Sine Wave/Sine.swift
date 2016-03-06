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
    var amplitude: Double!
    var frequency: Double!
    var phase: Double = 0
    var time: Double = 0
    
    /** Advance the phase */
    func step(inc: Double) {
        time += inc
    }
    
    init(frequency: Double, amplitude: Double) {
        self.frequency = frequency
        self.amplitude = amplitude
    }
}