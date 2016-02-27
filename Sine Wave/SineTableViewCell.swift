//
//  SineTableViewCell.swift
//  Sine Wave
//
//  Created by mitchell hudson on 2/25/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import UIKit

protocol SineTableViewCellDelegate {
    func remove(sine: Sine?)
}

class SineTableViewCell: UITableViewCell {
    
    var delegate: SineTableViewCellDelegate?
    
    var stepFormatter = NSNumberFormatter()
    var rangeFormatter = NSNumberFormatter()
    
    var sine: Sine? {
        didSet {
            updateLabels()
        }
    }
    
    
    // MARK: IBOutlets 
    
    @IBOutlet weak var rangeSlider: UISlider!
    @IBOutlet weak var stepSlider: UISlider!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var removeButton: UIButton!
    
    
    // MARK: IBActions
    
    @IBAction func rangeSliderChanged(sender: UISlider) {
        if let sine = sine {
            sine.radius = Double(sender.value)
            updateLabels()
        }
    }
    
    @IBAction func stepSliderChanged(sender: UISlider) {
        if let sine = sine {
            sine.frequency = Double(sender.value)
            updateLabels()
        }
        
    }
    
    @IBAction func removeButtonTapped(sender: UIButton) {
        if let delegate = delegate {
            // delegate.remove()
        }
    }
    
    
    
    func updateLabels() {
        if sine != nil {
            let formatter = NSNumberFormatter()
            formatter.numberStyle = .DecimalStyle
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            rangeLabel.text = formatter.stringFromNumber(sine!.radius)
            stepLabel.text = formatter.stringFromNumber(sine!.frequency)
        }
    }
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
