//
//  CashFlowViewController.swift
//  FInancialCalculator
//
//  Created by James Thang on 5/19/20.
//  Copyright © 2020 James Thang. All rights reserved.
//

import UIKit

class CashFlowViewController: UIViewController {

    @IBOutlet weak var segmentLabel: UISegmentedControl!
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var option2Label: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var option3Label: UILabel!
    
    @IBOutlet weak var optionTextField: UITextField!
    @IBOutlet weak var cashFlowTextField: UITextField!
    @IBOutlet weak var growthTextField: UITextField!
    @IBOutlet weak var returnTextField: UITextField!
    
    var valuationCalculator = ValuationModels()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        option3Label.isHidden = true
        optionTextField.isHidden = true
        optionLabel.text = "FCFE:"
        option2Label.text = "Cost of Equity:"
    }

    @IBAction func segmentPress(_ sender: UISegmentedControl) {
        switch segmentLabel.selectedSegmentIndex {
        case 0:
            optionLabel.text = "FCFE:"
            option2Label.text = "Cost of Equity:"
            option3Label.isHidden = true
            optionTextField.isHidden = true
            resetLabels()
            resultLabel.text = ""
        case 1:
            optionLabel.text = "FCFF:"
            option2Label.text = "Weighted Avegare cost of capital:"
            option3Label.isHidden = false
            optionTextField.isHidden = false
            resetLabels()
            resultLabel.text = ""
        default:
            optionLabel.text = "FCFE:"
            
        }
    }
    
    @IBAction func backPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func calculatePress(_ sender: UIButton) {
        
        if cashFlowTextField.text!.isEmpty || growthTextField.text!.isEmpty || returnTextField.text!.isEmpty {
            print("No")
        } else {

            if cashFlowTextField.text!.contains("..") || growthTextField.text!.contains("..") || returnTextField.text!.contains("..") ||
                optionTextField.text!.contains("..") {
                return
            }
            
            
            
            if let cashFlow = Double(cashFlowTextField.text!), let r = Double(returnTextField.text!), let g = Double(growthTextField.text!) {
                
                var result = valuationCalculator.gordonModel(d: cashFlow, g: g/100, r: r/100)
               
                switch segmentLabel.selectedSegmentIndex {
                case 0:
                    result = result*1
                case 1:
                    if let debt = Double(optionTextField.text!) {
                        result = result - debt
                    }
                default:
                    print("Unexpected")
                }

                
                let resultString = String(format: "%.2f", result)
                resultLabel.text = "Intrinsic Value = \(resultString)"
                
            } else {
                return
            }
            
            resetLabels()
        }
    }
    
    func resetLabels() {
        optionTextField.text = ""
        cashFlowTextField.text = ""
        growthTextField.text = ""
        returnTextField.text = ""
    }
}
