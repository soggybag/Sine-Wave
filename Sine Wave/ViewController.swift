//
//  ViewController.swift
//  Sine Wave
//
//  Created by mitchell hudson on 2/23/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    var waveManager: WaveManager!
    
    // MARK: IBOutlets

    @IBOutlet weak var sineWaveView: SineWaveView!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    // MARK: IBActions
    
    @IBAction func addSineButtonTapped(sender: UIButton) {
        SineStore.sharedInstance.add()
        waveManager.reloadData()
    }
    
    
    
    // MARK: TableView Delegate 
    
    
    
    
    
    override func viewDidLoad() {
        waveManager = WaveManager(tableView: tableView)
        tableView.dataSource = waveManager
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

