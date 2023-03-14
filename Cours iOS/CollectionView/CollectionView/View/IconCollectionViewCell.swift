//
//  IconCollectionViewCell.swift
//  CollectionView
//
//  Created by Dufour Sviatoslav on 28/02/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class IconCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imgImage: UIImageView!
    
    var image: Icon! {
        didSet {
            nameLabel.text = image.name
            imgImage.image = image.icon
        }
    }
}
