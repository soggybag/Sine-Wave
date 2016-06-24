//
//  SineStore.swift
//  Sine Wave
//
//  Created by mitchell hudson on 2/25/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import Foundation
import UIKit

class SineStore {
    static let sharedInstance = SineStore()
    private init() {
        array.append(Sine(frequency: 1, amplitude: 20, color: UIColor.redColor()))
        array.append(Sine(frequency: 2, amplitude: 30, color: UIColor.orangeColor()))
        array.append(Sine(frequency: 3, amplitude: 24, color: UIColor.greenColor()))
    }
    
    var array = [Sine]()
    
    var count: Int {
        get {
            return array.count
        }
    }
    
    
    func add(frequency: Double, amplitude: Double, color: UIColor) {
        array.append(Sine(frequency: frequency, amplitude: amplitude, color: color))
    }
    
    func removeAtIndex(index: Int) {
        array.removeAtIndex(index)
    }
    
    func getAtIndex(index: Int) -> Sine {
        // TODO: Iterator
        return array[index]
    }
    
    
}
