//
//  UserTableViewCell.swift
//  CallApi
//
//  Created by Dufour Sviatoslav on 09/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    var user: User! {
        didSet {
            nameLbl.text = user.firstName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
