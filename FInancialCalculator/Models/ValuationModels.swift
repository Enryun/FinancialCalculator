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
        ModelDetails(title: "Discount Divident", good: "", bad: ""),
        ModelDetails(title: "Free Cash Flow", good: "", bad: ""),
        ModelDetails(title: "Residual Income", good: "", bad: "")
    ]
}

struct ModelDetails {
    let title: String
    let good: String
    let bad: String
}
