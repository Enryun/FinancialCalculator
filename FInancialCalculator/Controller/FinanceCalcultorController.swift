//
//  FinanceCalcultorController.swift
//  FInancialCalculator
//
//  Created by James Thang on 4/27/20.
//  Copyright © 2020 James Thang. All rights reserved.
//

import UIKit

class FinanceCalcultorController: UIViewController {
    
    
    @IBOutlet weak var segmentLabel: UISegmentedControl!
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var ptmLabel: UITextField!
    @IBOutlet weak var returnLabel: UITextField!
    @IBOutlet weak var periodLabel: UITextField!
    @IBOutlet weak var optionPriceLabel: UITextField!
    
    let pvCalculator = PresentValue()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        optionLabel.text = "Future Value:"

    }
    
    
    @IBAction func segmentSelect(_ sender: UISegmentedControl) {
        switch segmentLabel.selectedSegmentIndex {
        case 0:
            optionLabel.text = "Future Value:"
            resetLabels()
        case 1:
            optionLabel.text = "Present Value:"
            resetLabels()
        default:
            optionLabel.text = "Future Value:"
        }
    }
    
    @IBAction func calculatePress(_ sender: UIButton) {
        if ptmLabel.text!.isEmpty || returnLabel.text!.isEmpty || periodLabel.text!.isEmpty || optionPriceLabel.text!.isEmpty {
            print("No")
        } else {

            if ptmLabel.text!.contains("..") || returnLabel.text!.contains("..") || optionPriceLabel.text!.contains("..") {
                return
            }
            
            if let ptm = Double(ptmLabel.text!), let r = Double(returnLabel.text!), let n = Double(periodLabel.text!), let optionValue = Double(optionPriceLabel.text!) {
                switch optionLabel.text {
                case "Present Value:":
                    let result = pvCalculator.futureValue(ptm: ptm, r: r/100, n: n, PV: optionValue)
                    let resultString = String(format: "%.2f", result)
                    resultLabel.text = "Present Value: \(resultString)"
                case "Future Value:":
                    let result = pvCalculator.presentValue(ptm: ptm, r: r/100, n: n, FV: optionValue)
                    let resultString = String(format: "%.2f", result)
                    resultLabel.text = "Future Value: \(resultString)"
                default:
                    print("Error calculate button")
                }
            } else {
                return
            }
                        
            resetLabels()
        }
    }
    
    func resetLabels() {
        ptmLabel.text = ""
        returnLabel.text = ""
        periodLabel.text = ""
        optionPriceLabel.text = ""
    }
    
   
}
