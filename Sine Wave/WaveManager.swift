//
//  WaveManager.swift
//  Sine Wave
//
//  Created by mitchell hudson on 2/25/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import Foundation
import UIKit

/** This class acts as data source and delegate for the sine wave table view.  */

class WaveManager: NSObject, UITableViewDataSource, SineTableViewCellDelegate {
    
    /** A UITableView Instance */
    var tableView: UITableView!
    
    
    // MARK: - Init
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    
    
    // MARK: - Utility Methods
    
    func reloadData() {
        tableView.reloadData()
    }
    
    /// SineTableViewCellDelegate method removes a Sine when the cell is removed.
    
    func removeSine(sine: Sine, cell: UITableViewCell) {
        if let indexPath = tableView.indexPathForCell(cell) {
            SineStore.sharedInstance.removeSine(sine)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
        }
    }
    
    
    // MARK: - TableView DataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SineStore.sharedInstance.count
    }
    
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .ByTruncatingTail
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! SineTableViewCell
        
        cell.delegate = self
        
        let sine = SineStore.sharedInstance.array[indexPath.row]
        
        cell.sine = sine
        cell.rangeSlider.value = Float(sine.amplitude)
        cell.stepSlider.value = Float(sine.frequency)
        cell.colorView.backgroundColor = sine.color
        
        return cell
    }
    
    
}
