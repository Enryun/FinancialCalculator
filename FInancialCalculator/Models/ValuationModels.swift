//
//  ValuationModels.swift
//  FInancialCalculator
//
//  Created by James Thang on 5/14/20.
//  Copyright © 2020 James Thang. All rights reserved.
//

import Foundation

struct ValuationModels {
    let details: [ModelDetails] = [
        ModelDetails(
            title: "Discount Divident",
            good: ["Stable future divident and growth rate"],
            bad: ["Sensitive to growth rate and return rate"]),
        ModelDetails(
            title: "Free Cash Flow",
            good: ["Companies don't pay Divident"],
            bad: ["Cashflow can be Negetive"]),
        ModelDetails(
            title: "Residual Income",
            good: [""],
            bad: [""])
    ]
    
    func gordonModel(d: Double, g: Double, r: Double) -> Double {
        let result = (d*(1+g))/(r - g)
        return result 
    }
}

struct ModelDetails {
    let title: String
    let good: [String]
    let bad: [String]
}
