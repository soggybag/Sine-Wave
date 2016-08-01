//
//  SineStore.swift
//  Sine Wave
//
//  Created by mitchell hudson on 2/25/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//


// A class to store Sine waves.

// TODO: Add core data or User defaults to persist Sine waves. 

import Foundation
import UIKit

class SineStore {
    
    // MARK: - Properties
    
    /// This is a singleton and this contains the only instance!
    static let sharedInstance = SineStore()
    
    /// An array of sine
    var array = [Sine]()
    
    /// Returns the number of sine waves stored
    var count: Int {
        get {
            return array.count
        }
    }
    
    
    // MARK: - Init
    
    private init() {
        // Add three default Sine waves
        add(1, amplitude: 20, color: UIColor.redColor())
        add(2, amplitude: 30, color: UIColor.orangeColor())
        add(3, amplitude: 14, color: UIColor.greenColor())
    }
    
    
    // MARK: - Utility Methods 
    

/** Add a new Sine to the store.
 - parameters:
     - frequency: Double the frequency of the new Sine
     - amplitude: Double the amplitude of the new Sine
     - color: UIColor the color used to draw this Sine
 */
    
    func add(frequency: Double, amplitude: Double, color: UIColor) {
        array.append(Sine(frequency: frequency, amplitude: amplitude, color: color))
    }
    
/** Removes the Sine at index.

- parameters: 
     - index: Int the index of the sine to remove
     
 */
    
    func removeAtIndex(index: Int) {
        let sine = array.removeAtIndex(index)
        sine.shapeLayer.removeFromSuperlayer()
    }
    
    
/** Removes sine by instance
- parameters:
     - sine: Sine the sine to remove
 */
    
    func removeSine(sine: Sine) {
        print("removing Sine with id: \(sine.id)")
        for i in 0 ..< array.count {
            if sine.id == array[i].id {
                removeAtIndex(i)
                return
            }
        }
    }
    
    /** Get the Sine at index
 - parameters: 
    - index: Int the index of the Sine to return 
 
 - returns: Sine
 */
    
    func getAtIndex(index: Int) -> Sine {
        // TODO: Iterator
        return array[index]
    }
    
    
}
