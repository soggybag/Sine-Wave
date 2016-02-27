//: Playground - noun: a place where people can play

import Cocoa

let formatter = NSNumberFormatter()
formatter.numberStyle = .DecimalStyle
formatter.minimumFractionDigits = 2
formatter.maximumFractionDigits = 2

formatter.stringFromNumber(0.123456)


