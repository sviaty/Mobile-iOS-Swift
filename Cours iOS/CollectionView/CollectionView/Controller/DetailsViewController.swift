//
//  DetailsViewController.swift
//  CollectionView
//
//  Created by Dufour Sviatoslav on 02/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    
    var icon: Icon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = icon.icon
        labelView.text = icon.name
    }

}
