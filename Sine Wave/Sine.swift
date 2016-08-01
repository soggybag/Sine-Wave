//
//  Sine.swift
//  Sine Wave
//
//  Created by mitchell hudson on 2/24/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

// Defines a Sine Wave

import Foundation
import UIKit

class Sine {
    
    // MARK: - Properties
    
    /// Provides each Sine with a unique id.
    static var idCount: Int = 0
    
    var amplitude: Double!
    var frequency: Double!
    var phase: Double = 0
    var time: Double = 0
    var color: UIColor!
    var id: Int
    
    let shapeLayer = CAShapeLayer()
    
    
    // MARK: - Init
    
    /** Initialize a Sine with frequency, Amplitude, and Color 
 - parameters: 
    - frequency: Double
    - amplitude: Double
    - color: UIColor
 */
    
    init(frequency: Double, amplitude: Double, color: UIColor) {
        self.frequency = frequency
        self.amplitude = amplitude
        self.color = color
        self.id = Sine.inc()
    }
    
    
    // MARK: - Methods
    
    /** Static mathod provides a unique id for each Sine
 - returns: Int */
    
    static func inc() -> Int {
        Sine.idCount += 1
        return Sine.idCount
    }
    
    /** Advance the phase 
 - parameters:
    - inc: Double increment step used for animation */
    
    func step(inc: Double) {
        time += inc
    }
    
}