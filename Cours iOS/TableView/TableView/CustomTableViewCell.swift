//
//  CustomTableViewCell.swift
//  TableView
//
//  Created by Dufour Sviatoslav on 28/02/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var personne: Personne! {
        didSet {
            nameLabel.text = personne.name
            ageLabel.text = String(personne.age)
        }
    }
}
