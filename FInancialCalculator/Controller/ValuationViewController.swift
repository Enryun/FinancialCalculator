//
//  ValuationViewController.swift
//  FInancialCalculator
//
//  Created by James Thang on 5/14/20.
//  Copyright © 2020 James Thang. All rights reserved.
//

import UIKit



class ValuationViewController: UIViewController {

    var valuationCalculator = ValuationModels()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func dividentBtn(_ sender: UIButton) {
        let userChoice = sender.titleLabel?.text
        valuationCalculator.title = userChoice
        performSegue(withIdentifier: "toDetails", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! ModelDetailsViewController
        detailVC.modalPresentationStyle = .fullScreen
        
        detailVC.titleContent = valuationCalculator.title
        detailVC.detailContent = valuationCalculator.details
        detailVC.nextVCIdentifier = valuationCalculator.identifier
    }
}
