//
//  SineWaveView.swift
//  Sine Wave
//
//  Created by mitchell hudson on 2/25/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

// This class draws sine waves into a UIView

import UIKit

class SineWaveView: UIView {
    
    // MARK: - Properties
    
    var centerY: Double = 0
    var stepX: Double = 0
    var steps = 200
    var timer: NSTimer!
    var isRunning = true
    
    let shapeLayer = CAShapeLayer()
    
    var displayAsSum = true
    
    
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    
    
    
    // MARK: - Setup
    
    func setup() {
        layer.addSublayer(shapeLayer)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.04, target: self, selector: #selector(SineWaveView.onTimer(_:)), userInfo: nil, repeats: true)
        
        centerY = Double(frame.height) / 2
        stepX = Double(frame.width / CGFloat(steps))
    }
    
    
    
    // MARK: - Utilities
    
    func pause() {
        isRunning = false
    }
    
    func run() {
        isRunning = true
    }
    
    func onTimer(timer: NSTimer) {
        drawSineWaves()
    }
    
    func drawSineWaves() {
        
        // ------------------------------------------------------------------
        // Sum Sine waves
        
        let sumPath = UIBezierPath()
        var sinSum = Array<CGFloat>(count: steps, repeatedValue: 0)
        
        for i in 0..<SineStore.sharedInstance.count {
            let path = UIBezierPath()
            let sine = SineStore.sharedInstance.getAtIndex(i)
            if isRunning {
                sine.step(0.1)
            }
            
            let f = M_PI * 2 / Double(steps) * sine.frequency
            for p in 0..<steps {
                let inc = Double(p)
                let x = inc * stepX
                let y = sin((Double(p) * f)+sine.phase+sine.time) * sine.amplitude
                sinSum[p] += CGFloat(y)
                
                if p == 0 {
                    path.moveToPoint(CGPoint(x: x, y: y + centerY))
                } else {
                    path.addLineToPoint(CGPoint(x: x, y: y + centerY))
                }
            }
            
            sine.shapeLayer.path = path.CGPath
            layer.addSublayer(sine.shapeLayer)
            sine.shapeLayer.lineWidth = 2
            sine.shapeLayer.fillColor = UIColor.clearColor().CGColor
            sine.shapeLayer.strokeColor = sine.color.CGColor // UIColor.redColor().CGColor
        }
        
        sumPath.moveToPoint(CGPoint(x: 0, y:sinSum[0] + CGFloat(centerY)))
        for i in 1..<sinSum.count {
            let x = CGFloat(i) * CGFloat(stepX)
            sumPath.addLineToPoint(CGPoint(x: x, y: sinSum[i] + CGFloat(centerY)))
        }
        
        if displayAsSum {
            shapeLayer.path = sumPath.CGPath
            shapeLayer.fillColor = UIColor.clearColor().CGColor
            shapeLayer.lineWidth = 2
            shapeLayer.strokeColor = UIColor.whiteColor().CGColor
            
            layer.addSublayer(shapeLayer)
        } else {
            shapeLayer.path = nil
        }
    }
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
