//
//  HeaderView.swift
//  CustomClasses
//
//  Created by Dufour Sviatoslav on 21/02/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    var imgView: CustomImageView?
    
    func setup(_ imgName: String){
        if imgView == nil {
            imgView = CustomImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            addSubview(imgView!)
        }
        
        // ajout de contrainte
        imgView?.translatesAutoresizingMaskIntoConstraints = false
        imgView?.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imgView?.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imgView?.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imgView?.heightAnchor.constraint(equalToConstant: 200).isActive = true
            
        imgView?.setup("sviatoslav")
        
    }
   

}
