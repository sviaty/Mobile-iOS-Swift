//
//  ViewController.swift
//  CollectionView
//
//  Created by Dufour Sviatoslav on 28/02/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var icons: [Icon] = Datas().icons
    var sections: [IconSection] = Datas().sections

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let collectionFrame = collectionView.frame
        let w = collectionFrame.width / 2.2
        let h = 60
        let layout = CustomLayout().withHeader(CGFloat(w), CGFloat(h), collectionFrame.width, 60)
        collectionView.collectionViewLayout = layout
    }
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].icons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = sections[indexPath.section]
        let item = section.icons[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Icon2Cell", for: indexPath) as! Icon2CollectionViewCell
        
        cell.setup(item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? HeaderView {
                header.nameSection.text = sections[indexPath.section].name
                return header
            }
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = sections[indexPath.section].icons[indexPath.item]
        
        performSegue(withIdentifier: "goToDetails", sender: item)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetails" {
            if let new = segue.destination as? DetailsViewController {
                new.icon = sender as? Icon
            }
        }
    }

    

}

