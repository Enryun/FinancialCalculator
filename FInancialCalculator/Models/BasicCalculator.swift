//
//  BasicCalculator.swift
//  FInancialCalculator
//
//  Created by James Thang on 4/24/20.
//  Copyright © 2020 James Thang. All rights reserved.
//

import Foundation

struct BasicCalculator {
    var twoNumberTuple: (firstNumber: Double, symbol: String)?
    var resultDisplay: String?
    
    mutating func twoNumberCalculation(secondNumber: Double) -> Double {
        if let tuple = self.twoNumberTuple{
            let firstNumber = tuple.firstNumber
            let calculationSymbol = tuple.symbol
            
            switch calculationSymbol {
            case "+":
                resultDisplay = "\(firstNumber) + \(secondNumber) = "
                return firstNumber + secondNumber
            case "-":
                resultDisplay = "\(firstNumber) - \(secondNumber) = "
                return firstNumber - secondNumber
            case "x":
                resultDisplay = "\(firstNumber) x \(secondNumber) = "
                return firstNumber * secondNumber
            case "÷":
                resultDisplay = "\(firstNumber) ÷ \(secondNumber) = "
                return firstNumber / secondNumber
            default:
                print("Not enought Data")
            }
        }
        self.twoNumberTuple = (firstNumber: 0, symbol: "")
        return 404
    }
}
