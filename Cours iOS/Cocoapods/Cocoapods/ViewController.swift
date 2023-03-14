//
//  ViewController.swift
//  Cocoapods
//
//  Created by Dufour Sviatoslav on 09/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit
import SVGKit
//import SDWebImageSVGCoder

class ViewController: UIViewController {

    @IBOutlet weak var svgImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageSvgUrl = URL(string: "https://upload.wikimedia.org/wikipedia/commons/b/b0/NewTux.svg")
        
        // With SVG kit
        svgImageView.image = SVGKImage(contentsOf: imageSvgUrl).uiImage
        
        // With SDWebImage
        //svgImageView.sd_setImage(with: imageSvgUrl, completed: nil)
        
        
    }


}

