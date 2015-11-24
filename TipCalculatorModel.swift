//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Hien Le on 11/24/15.
//  Copyright © 2015 Hien Le. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    
    var total: Double = 0.0
    var taxPct: Double = 0.0
    var subTotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct: Double) -> Double {
        return subTotal * tipPct
    }
    
    func returnPossibleTips() -> [Int: Double] {
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        
        var retval = [Int: Double]()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip * 100)
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
    
}