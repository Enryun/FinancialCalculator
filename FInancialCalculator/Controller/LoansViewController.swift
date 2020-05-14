//
//  LoansViewController.swift
//  FInancialCalculator
//
//  Created by James Thang on 4/28/20.
//  Copyright © 2020 James Thang. All rights reserved.
//

import UIKit

class LoansViewController: UIViewController {
    
    @IBOutlet weak var loanAmountLabel: UITextField!
    @IBOutlet weak var interestRatelabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    var loanCalculator = LoanCalculator()
    
    var cellArray: [LoanCell] = []
    
    private var months: Double = 60
    private var interestMonths: Double = 5/1200
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func interestStepper(_ sender: UIStepper) {
        let interest = String(format: "%.1f" ,sender.value)
        interestRatelabel.text = "\(interest) %"
        
        interestMonths = (sender.value)/1200
    }
    
    
    @IBAction func yearsSlider(_ sender: UISlider) {
        let loanPeriods = Int(sender.value)
        yearLabel.text = "\(loanPeriods) years"
        
        months = Double(loanPeriods)*12
    }
    

    @IBAction func calculatePressed(_ sender: UIButton) {
        if let loans = loanAmountLabel.text{
            loanCalculator.loanAmount = Double(loans)
            loanCalculator.beginBalance = Double(loans)
            
            if loanCalculator.loanAmount != nil {
                loanCalculator.years = months
                loanCalculator.interestRate = interestMonths
                loanCalculator.amotizationLoan()
                performSegue(withIdentifier: "toTableLoan", sender: self)
            } else {
                print("Empty loans amount")
                
                // Insert Alert box
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! LoanTableViewViewController
        
        // Display Full Sceneeee
        secondVC.modalPresentationStyle = .fullScreen
        
        secondVC.anuiatyAmount = loanCalculator.anuiaty
        secondVC.numberOfRow = loanCalculator.years
        
        let endLoops = Int(loanCalculator.years!)
        
        for _ in 1...endLoops {
            let cell = loanCalculator.repetitive(beginBalance: loanCalculator.beginBalance)
            cellArray.append(cell)
            loanCalculator.beginBalance = cell.endBalance
        }
        
        secondVC.cellArray = cellArray
    }
}
