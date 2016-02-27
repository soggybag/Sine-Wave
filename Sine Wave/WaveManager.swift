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
    
    func remove(sine: Sine?) {
        SineStore.sharedInstance
    }
    
    // MARK: TableView DataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SineStore.sharedInstance.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! SineTableViewCell
        
        let sine = SineStore.sharedInstance.array[indexPath.row]
        cell.sine = sine
        cell.rangeSlider.value = Float(sine.radius)
        cell.stepSlider.value = Float(sine.frequency)
        cell.delegate = self
        
        return cell
    }
    
    
    func reloadData() {
        tableView.reloadData()
    }
    
    
    init(tableView: UITableView) {
        self.tableView = tableView
        
    }
    
}
