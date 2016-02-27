//
//  SineWaveView.swift
//  Sine Wave
//
//  Created by mitchell hudson on 2/25/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import UIKit

class SineWaveView: UIView {

    var pathLayer = CAShapeLayer()
    var centerY: Double = 0
    var stepX: Double = 0
    var timer: NSTimer!
    var isRunning = true
    
    func setup() {
        layer.addSublayer(pathLayer)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.04, target: self, selector: "onTimer:", userInfo: nil, repeats: true)
        
        centerY = Double(frame.height) / 2
        stepX = Double(frame.width / 100.0)
    }
    
    
    func pause() {
        isRunning = false
    }
    
    
    func run() {
        isRunning = true
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func onTimer(timer: NSTimer) {
        drawSineWaves()
    }
    
    
    func drawSineWaves() {
        let path = UIBezierPath()
        for i in 0..<SineStore.sharedInstance.count {
            let sine = SineStore.sharedInstance.getAtIndex(i)
            if isRunning {
                sine.step()
            }
            path.moveToPoint(CGPoint(x: 0, y: centerY))
            for p in 0..<100 {
                let inc = Double(p)
                let x = inc * stepX
                let y = (sin((inc * sine.frequency) + sine.phase) * sine.radius) + centerY
                path.addLineToPoint(CGPoint(x: x, y: y))
            }
        }
        
        pathLayer.path = path.CGPath
        pathLayer.fillColor = UIColor.clearColor().CGColor
        pathLayer.strokeColor = UIColor.redColor().CGColor
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
