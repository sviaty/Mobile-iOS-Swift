//
//  File.swift
//  CollectionView
//
//  Created by Dufour Sviatoslav on 02/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class CustomLayout {
    
    func setup(_ width: CGFloat, _ height: CGFloat) ->
        UICollectionViewFlowLayout {
           let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: width, height: height)
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 20
            return layout
        }
    
    func horizontalSquare(_ size: CGFloat) -> UICollectionViewFlowLayout {
        let l = setup(size, size)
        l.scrollDirection = .horizontal
        return l
    }
    
    func withHeader(_ width: CGFloat, _ height: CGFloat, _ headerWidth: CGFloat, _ headerHeight: CGFloat) ->
        UICollectionViewFlowLayout {
            let l = setup(width, height)
            l.headerReferenceSize = CGSize(width: headerWidth, height: headerHeight)
            return l
    }
}
