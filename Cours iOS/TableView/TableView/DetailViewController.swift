//
//  DetailViewController.swift
//  TableView
//
//  Created by Dufour Sviatoslav on 28/02/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var textDetailOption: String?
    
    @IBOutlet weak var labelTextDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let textDetail = textDetailOption {
            labelTextDetail.text = textDetail
        }
    }
    
    

}
