//
//  ModelDetailsViewController.swift
//  FInancialCalculator
//
//  Created by James Thang on 5/14/20.
//  Copyright © 2020 James Thang. All rights reserved.
//

import UIKit

class ModelDetailsViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var navigationTitle: UINavigationItem!
    
    var nextVCIdentifier: String = "toDivident"
    var titleContent: String?
    var detailContent: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailLabel.text = detailContent
        navigationTitle.title = titleContent
    }

    @IBAction func backPress(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func nextPress(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: nextVCIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination
        nextVC.modalPresentationStyle = .fullScreen
    }
}
