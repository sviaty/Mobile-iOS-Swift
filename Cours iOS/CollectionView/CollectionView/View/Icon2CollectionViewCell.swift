//
//  Icon2CollectionViewCell.swift
//  CollectionView
//
//  Created by Dufour Sviatoslav on 02/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class Icon2CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    
    var icon: Icon!
    
    func setup(_ icon: Icon){
        self.layer.borderColor = UIColor.label.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.icon = icon
        imageView.image = self.icon.icon
        labelView.text = self.icon.name
    }
}
