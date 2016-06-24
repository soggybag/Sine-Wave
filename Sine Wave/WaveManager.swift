//
//  WaveManager.swift
//  Sine Wave
//
//  Created by mitchell hudson on 2/25/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import Foundation
import UIKit

class WaveManager: NSObject, UITableViewDataSource, SineTableViewCellDelegate {
    
    var tableView: UITableView!
    
    
    // MARK: Sine TableView Cell Delegate
    
    func removeSineAtIndexPath(indexPath: NSIndexPath) {
        SineStore.sharedInstance.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
    }
    
    // MARK: TableView DataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SineStore.sharedInstance.count
    }
    
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .ByTruncatingTail
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! SineTableViewCell
        
        let sine = SineStore.sharedInstance.array[indexPath.row]
        cell.sine = sine
        cell.rangeSlider.value = Float(sine.amplitude)
        cell.stepSlider.value = Float(sine.frequency)
        cell.delegate = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    
    
    func reloadData() {
        tableView.reloadData()
    }
    
    
    init(tableView: UITableView) {
        self.tableView = tableView
        
    }
    
}
