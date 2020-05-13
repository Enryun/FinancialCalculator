//
//  LoanTableViewViewController.swift
//  FInancialCalculator
//
//  Created by James Thang on 5/5/20.
//  Copyright © 2020 James Thang. All rights reserved.
//

import UIKit

class LoanTableViewViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var anuiatyAmount: Double?
    var numberOfRow: Double?
    var cellArray = [LoanCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self

        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "tableCell")
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension LoanTableViewViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(numberOfRow!)
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! CustomCell
        
        let currentItem = cellArray[indexPath.row]

        cell.payment.text = String(format: "%.2f", anuiatyAmount!)
        cell.number.text = String(indexPath.row + 1)
        cell.interest.text = String(format: "%.2f", currentItem.interestAmount)
        cell.principal.text = String(format: "%.2f", currentItem.principalAmount)
        cell.balance.text = String(format: "%.2f", currentItem.endBalance)
        
        return cell
    }
}
