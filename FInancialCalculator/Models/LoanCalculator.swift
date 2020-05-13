//
//  LoanCalculator.swift
//  FInancialCalculator
//
//  Created by James Thang on 4/28/20.
//  Copyright © 2020 James Thang. All rights reserved.
//

import Foundation

struct LoanCalculator {
    
    var loanAmount: Double?
    var interestRate: Double?
    var years: Double?
    
    var anuiaty: Double?
    
    mutating func amotizationLoan() {
        let denominator = pow(1 + self.interestRate!, self.years!) - 1
        anuiaty = loanAmount!*(self.interestRate! + self.interestRate!/denominator)
    }
    
    
    var beginBalance: Double?
    
    mutating func repetitive(beginBalance: Double?) -> LoanCell {
        let interestAmount = beginBalance!*interestRate!
        let principalAmount = anuiaty! - interestAmount
        let endBalance = beginBalance! - principalAmount
        
        let cell = LoanCell(interestAmount: interestAmount, principalAmount: principalAmount, endBalance: endBalance)
        return cell
    }
}

struct LoanCell {
    let interestAmount: Double
    let principalAmount: Double
    let endBalance: Double
}

