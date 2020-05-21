//
//  DividentDiscountViewController.swift
//  FInancialCalculator
//
//  Created by James Thang on 5/14/20.
//  Copyright © 2020 James Thang. All rights reserved.
//

import UIKit

class DividentDiscountViewController: UIViewController {
    
    
    @IBOutlet weak var segmentLabel: UISegmentedControl!
    @IBOutlet weak var dividentValue: UITextField!
    @IBOutlet weak var growthRateValue: UITextField!
    @IBOutlet weak var returnValue: UITextField!
    @IBOutlet weak var resultValue: UILabel!

    @IBOutlet weak var boomStack: UIStackView!
    @IBOutlet weak var steadyStack: UIStackView!
    @IBOutlet weak var growStack: UIStackView!
    
    
    @IBOutlet weak var fastGrowRate: UITextField!
    @IBOutlet weak var steadyGrowRate: UITextField!
    @IBOutlet weak var fastYears: UITextField!
    
    
    let valuationCalculator = ValuationModels()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boomStack.isHidden = true
        steadyStack.isHidden = true
    }
    
    @IBAction func backPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func segmentPress(_ sender: UISegmentedControl) {
        switch segmentLabel.selectedSegmentIndex {
        case 0:
            boomStack.isHidden = true
            steadyStack.isHidden = true
            growStack.isHidden = false
            resetLabels()
            resultValue.text = ""
        case 1:
            boomStack.isHidden = false
            steadyStack.isHidden = false
            growStack.isHidden = true
            resetLabels()
            resultValue.text = ""
        default: break
        }
    }
    
    
    @IBAction func CalculatePressed(_ sender: UIButton) {
        if dividentValue.text!.isEmpty || returnValue.text!.isEmpty {
                    print("No")
                } else {

                    if dividentValue.text!.contains("..") || returnValue.text!.contains("..") {
                        return
                    }
                    
                    if let divident = Double(dividentValue.text!), let r = Double(returnValue.text!)  {
                        
                        switch segmentLabel.selectedSegmentIndex {
                        case 0:
                            if growthRateValue.text!.isEmpty || growthRateValue.text!.contains("..") {
                                return
                            }
                            
                            if let g = Double(growthRateValue.text!) {
                                let result = valuationCalculator.gordonModel(d: divident, g: g/100, r: r/100)
                                let resultString = String(format: "%.2f", result)
                                resultValue.text = "Intrinsic Value = \(resultString)"
                            }
                        case 1:
                            if fastGrowRate.text!.isEmpty || steadyGrowRate.text!.isEmpty || fastYears.text!.isEmpty || fastGrowRate.text!.contains("..") || steadyGrowRate.text!.contains("..") || fastYears.text!.contains(".") {
                                return
                            }
                            
                            if let gFast = Double(fastGrowRate.text!), let gSteady = Double(steadyGrowRate.text!), let years = Double(fastYears.text!)  {
                                let result = valuationCalculator.twoStageDivident(divident: divident, gS: gFast/100, gL: gSteady/100, r: r/100, n: years)
                                let resultString = String(format: "%.2f", result)
                                resultValue.text = "Intrinsic Value = \(resultString)"
                            }
                        default:
                            print("Unexpected")
                        }
                        

                    } else {
                        return
                    }
                    
                    resetLabels()
                }
    }
    
    
    
    func resetLabels() {
        dividentValue.text = ""
        growthRateValue.text = ""
        returnValue.text = ""
        fastGrowRate.text = ""
        steadyGrowRate.text = ""
        fastYears.text = ""
    }
}
