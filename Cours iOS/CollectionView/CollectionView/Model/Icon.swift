//
//  Icon.swift
//  CollectionView
//
//  Created by Dufour Sviatoslav on 28/02/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class Icon {
    var name: String
    var icon: UIImage?
    
    init(_ name : String) {
        self.name = name
        self.icon = UIImage(systemName: name)
    }
}
