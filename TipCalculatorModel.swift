//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Kunal Thorat on 2/7/15.
//  Copyright (c) 2015 ThorCorp. All rights reserved.
//

import Foundation

class TipCalculatorModel
{
    var total: Double
    var taxPct: Double
    var subTotal: Double
    {
        get
        {
            return total/(taxPct+1)
        }
    }
    
    init(total: Double, taxPct: Double)
    {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct: Double) -> Double
    {
        return subTotal * tipPct
    }
    
    func returnPossibleTips() -> [Int: Double]
    {
        let possibleTipsInferred = [0.15, 0.20, 0.25]
        let possibleTipsExplicit: [Double] = [0.15, 0.20, 0.25]
        
        var retVal = [Int: Double]()
        
        for possibleTip in possibleTipsInferred
        {
            let intPct = Int(possibleTip*100)
            retVal[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retVal
    }
}