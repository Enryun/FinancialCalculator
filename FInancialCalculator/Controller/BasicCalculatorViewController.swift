//
//  ViewController.swift
//  FInancialCalculator
//
//  Created by James Thang on 4/22/20.
//  Copyright © 2020 James Thang. All rights reserved.
//

import UIKit

class BasicCalculatorViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    private var isFinishTyping = true
    
    // Compute Variable handling String/Double Converting
    private var resultValue: Double {
        get {
            guard let number = Double(resultLabel.text!) else {
                fatalError("Cannot convert to Double")
            }
            return number
        }
        
        set {
            resultLabel.text = String(newValue)
        }
    }
    
    var calculator = BasicCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if let numberValue = sender.currentTitle {
            if isFinishTyping {
                resultLabel.text = numberValue
                isFinishTyping = false
            } else {
             
                
                // Make sure no Double "." is happenning
                if numberValue == "." {
                
                    // Make sure no Double "." is happenning > Bitchhh

                    if resultLabel.text!.contains(".") {
                        return
                    }
                    
                    let isInt = floor(resultValue) == resultValue

                    if !isInt {
                        return
                    }
                }

                resultLabel.text = resultLabel.text! + numberValue
            }
        }
    }
    
    
    @IBAction func calculationSymbolsPressed(_ sender: UIButton) {
        let symbol = sender.currentTitle!
        
        if symbol == "=" {
//            if let tuple = calculator.twoNumberTuple{
//                let firstNumber = tuple.firstNumber
//                let calculationSymbol = tuple.symbol
//
//                switch calculationSymbol {
//                case "+":
//                    resultValue = firstNumber + resultValue
//                case "-":
//                    resultValue = firstNumber - resultValue
//                case "x":
//                    resultValue = firstNumber * resultValue
//                case "÷":
//                    resultValue = firstNumber / resultValue
//                default:
//                    print("Not enought Data")
//                }
//            }
//            calculator.twoNumberTuple = (firstNumber: 0, symbol: "")
            
            resultValue = calculator.twoNumberCalculation(secondNumber: resultValue)
        } else if symbol == "AC" {
            resultValue = 0
        } else if symbol == "%" {
            resultValue = resultValue/100
        } else if symbol == "+/-" {
            resultValue = resultValue * -1
        } else {
            calculator.twoNumberTuple = (firstNumber: resultValue, symbol: symbol)
        }
        
        isFinishTyping = true
    }
    
}

