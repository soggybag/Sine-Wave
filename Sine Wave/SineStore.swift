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
        array.append(Sine(frequency: 0.1, radius: 20))
        array.append(Sine(frequency: 0.08, radius: 30))
        array.append(Sine(frequency: 0.13, radius: 24))
    }
    
    var array = [Sine]()
    
    var count: Int {
        get {
            return array.count
        }
    }
    
    
    func add() {
        array.append(Sine(frequency: 0.1, radius: 20))
    }
    
    func removeAtIndex(index: Int) {
        array.removeAtIndex(index)
    }
    
    func getAtIndex(index: Int) -> Sine {
        // TODO: Iterator
        return array[index]
    }
    
    
}
