//
//  ValuationViewController.swift
//  FInancialCalculator
//
//  Created by James Thang on 5/14/20.
//  Copyright © 2020 James Thang. All rights reserved.
//

import UIKit



class ValuationViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func dividentBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "toDivident", sender: self)
    }
    
    @IBAction func fcfBtn(_ sender: Any) {
    }
    
    @IBAction func residualBtn(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination
        secondVC.modalPresentationStyle = .fullScreen

    }

}