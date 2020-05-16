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
                return "Opportunity Cost View"
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
}


