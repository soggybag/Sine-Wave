//
//  SineTableViewCell.swift
//  Sine Wave
//
//  Created by mitchell hudson on 2/25/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

// Custom tableview cell displays sine properties and controls

import UIKit


///

protocol SineTableViewCellDelegate {
    func removeSine(sine: Sine, cell: UITableViewCell)
}





class SineTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var delegate: SineTableViewCellDelegate?
    var stepFormatter = NSNumberFormatter()
    var rangeFormatter = NSNumberFormatter()
    var sine: Sine? {
        didSet {
            updateLabels()
        }
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var rangeSlider: UISlider!
    @IBOutlet weak var stepSlider: UISlider!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var phaseSlider: UISlider!
    @IBOutlet weak var phaseLabel: UILabel!
    
    @IBOutlet weak var colorView: UIView!
    
    
    // MARK: - IBActions
    
    @IBAction func rangeSliderChanged(sender: UISlider) {
        if let sine = sine {
            sine.amplitude = Double(sender.value)
            updateLabels()
        }
    }
    
    @IBAction func stepSliderChanged(sender: UISlider) {
        if let sine = sine {
            sine.frequency = Double(sender.value)
            updateLabels()
        }
    }
    
    
    @IBAction func phaseSliderChanged(sender: UISlider) {
        if let sine = sine {
            sine.phase = Double(sender.value)
            updateLabels()
        }
    }
    
    
    
    @IBAction func removeButtonTapped(sender: UIButton) {
        guard let delegate = delegate, let sine = sine else {
            return
        }
        
        delegate.removeSine(sine, cell: self)
    }
    
    
    
    // MARK: - Utility methods
    
    func updateLabels() {
        if sine != nil {
            let formatter = NSNumberFormatter()
            formatter.numberStyle = .DecimalStyle
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            rangeLabel.text = formatter.stringFromNumber(sine!.amplitude)
            stepLabel.text = formatter.stringFromNumber(sine!.frequency)
            phaseLabel.text = formatter.stringFromNumber(sine!.phase)
        }
    }
    
    
    
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
