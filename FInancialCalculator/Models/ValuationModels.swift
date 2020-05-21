//
//  ValuationModels.swift
//  FInancialCalculator
//
//  Created by James Thang on 5/14/20.
//  Copyright © 2020 James Thang. All rights reserved.
//

import Foundation

struct ValuationModels {
    
    var title: String?
    
    var details: String {
        get {
            switch title {
            case "Divident Discount":
                return "Good for Companies with Stable future divident and growth rate, but the result wil be sensitive to growth rate and return rate"
            case "Free CashFlow":
                return "Best for Companies that don't pay Cash Divident. Becareful with Negetive or Zero Cashflow"
            case "Residual Income":
                return "Viewing as Real Economic Profitibility adding to Investor but heavily affect by Accounting Numbers. Can suffer from Data Manipulations."
            default:
                return "Unexpected"
            }
            
        }
    }
    
    var identifier: String {
        get {
            switch title {
            case "Divident Discount":
                return "toDivident"
            case "Free CashFlow":
                return "toFCFE"
            case "Residual Income":
                return "toResidual"
            default:
                return "Unexpected"
            }
            
        }
    }
    
    func gordonModel(d: Double, g: Double, r: Double) -> Double {
        let result = (d*(1+g))/(r - g)
        return result 
    }
    
    func residualIncome(netIncome: Double, g: Double, r: Double, beginBV: Double, endingBV: Double) -> Double {
        let averageBV = (beginBV + endingBV)/2
        let ROE = netIncome/averageBV
        let intermediate = (ROE - r)/(r - g)
        let result = endingBV + endingBV*intermediate
        return result
    }
    
    func twoStageDivident(divident: Double, gS: Double, gL: Double, r: Double, n: Double) -> Double {
        let lastDivident = (divident*(1 + gL)*pow(1 + gS, n))/((r - gL)*pow(1 + r, n))
        print(lastDivident)
        let sumIndividualDividents = sumOfDividents(divident: divident, n: n, r: r, g: gS)
        let result = lastDivident + sumIndividualDividents
        return result
    }
    
    func sumOfDividents(divident: Double, n: Double, r: Double, g: Double) -> Double {
        var result = 0.0
        
        for i in 1...Int(n) {
            let discountDivident = (divident*pow(1 + g, Double(i)))/pow(1 + r, Double(i))
            print(discountDivident)
            result = result + discountDivident
        }
        
        return result
    }
}


