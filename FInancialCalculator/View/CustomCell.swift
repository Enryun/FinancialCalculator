//
//  CustomCell.swift
//  FInancialCalculator
//
//  Created by James Thang on 5/4/20.
//  Copyright © 2020 James Thang. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var payment: UILabel!
    
    @IBOutlet weak var interest: UILabel!
    
    @IBOutlet weak var principal: UILabel!
    @IBOutlet weak var balance: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
