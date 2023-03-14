//
//  CustomImage.swift
//  CustomClasses
//
//  Created by Dufour Sviatoslav on 21/02/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {
    
    // Constructeur appeler dans le code
    override init(frame: CGRect) {
        super.init(frame: frame)
        //setup("gaelle")
    }
    
    // Constructeur appeler dans linterface utilisateur
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //setup("gaelle")
    }
    
    func setup(_ imgName: String){
        self.image = UIImage(named: imgName)
        self.layer.cornerRadius = frame.height / 2
        clipsToBounds = true
        contentMode = .scaleAspectFill
    }
    
}
