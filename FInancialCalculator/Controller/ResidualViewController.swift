//
//  ResidualViewController.swift
//  FInancialCalculator
//
//  Created by James Thang on 5/20/20.
//  Copyright © 2020 James Thang. All rights reserved.
//

import UIKit

class ResidualViewController: UIViewController {
    
    let valuationCalculator = ValuationModels()
    
    @IBOutlet weak var netIncome: UITextField!
    @IBOutlet weak var beginBookValue: UITextField!
    @IBOutlet weak var endBookValue: UITextField!
    @IBOutlet weak var growth: UITextField!
    @IBOutlet weak var returnRate: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


    @IBAction func backPress(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func calculatePress(_ sender: UIButton) {
        if netIncome.text!.isEmpty || beginBookValue.text!.isEmpty || endBookValue.text!.isEmpty || growth.text!.isEmpty || returnRate.text!.isEmpty {
            print("No")
        } else {

            if netIncome.text!.contains("..") || beginBookValue.text!.contains("..") || returnRate.text!.contains("..") ||
            growth.text!.contains("..") || endBookValue.text!.contains("..") {
                return
            }
            
            
            if let netIncome = Double(netIncome.text!), let r = Double(returnRate.text!), let g = Double(growth.text!),
                let beginBV = Double(beginBookValue.text!), let endBV = Double(endBookValue.text!) {
                
                let result = valuationCalculator.residualIncome(netIncome: netIncome, g: g/100, r: r/100, beginBV: beginBV, endingBV: endBV)
                let resultString = String(format: "%.2f", result)
                resultLabel.text = "Intrinsic Value = \(resultString)"
                
            } else {
                return
            }
            
            resetLabels()
        }
    }
    
    func resetLabels() {
        netIncome.text = ""
        returnRate.text = ""
        growth.text = ""
        beginBookValue.text = ""
        endBookValue.text = ""
    }
}
