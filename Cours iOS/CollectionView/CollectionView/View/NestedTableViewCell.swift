//
//  NestedTableViewCell.swift
//  CollectionView
//
//  Created by Dufour Sviatoslav on 02/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class NestedTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var section: IconSection!
    
    func setup(section: IconSection){
        self.section = section
        nameLabel.text = self.section.name
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = CustomLayout().horizontalSquare(self.contentView.frame.height - 35)
    }

}

extension NestedTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.section.icons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = self.section.icons[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconCell", for: indexPath) as! IconCollectionViewCell
        cell.image = item
        return cell
    }
}
