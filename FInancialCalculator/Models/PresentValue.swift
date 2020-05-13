//
//  PresentValue.swift
//  FInancialCalculator
//
//  Created by James Thang on 5/9/20.
//  Copyright © 2020 James Thang. All rights reserved.
//

import Foundation

struct PresentValue {
    
    func presentValue(ptm: Double, r: Double, n: Double, FV: Double) -> Double {
        let first = ptm/r
        let second = pow(1+r, n)
        let third = 1 - 1/second
        let future = FV/second
        let result = first*third + future
        return result
    }
    
    func futureValue(ptm: Double, r: Double, n: Double, PV: Double) -> Double {
        let first = ptm/r
        let second = pow(1+r, n) - 1
        let present = PV*pow(1+r, n)
        let result = first*second + present
        return result
    }
}
