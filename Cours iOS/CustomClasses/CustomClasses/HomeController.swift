//
//  HomeController.swift
//  CustomClasses
//
//  Created by Dufour Sviatoslav on 21/02/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    var newViewOptionel: UIView?
    var newlabelOptionel: UILabel?
    //@IBOutlet weak var imgViewCustom: CustomImageView!
    
    @IBOutlet weak var header: HeaderView!
    
    func setupView() {
        if let mainView = view {
            
            //  Lister les subviews
            mainView.subviews.forEach { (v) in
                //print("View : \(v)")
            }
            
            // Création d'une frame
            let rect = CGRect(x: (view.frame.width / 2) - 50, y: 300, width: 100, height: 100)
        
            newViewOptionel = UIView(frame: rect)
            guard newViewOptionel != nil else { return }
            newViewOptionel?.backgroundColor = .systemBlue
            mainView.addSubview(newViewOptionel!)
                
            // Positionnement de la vue par rapport à la superview
            print("View Fame: \(newViewOptionel!.frame)")
            
            // Positionnement de la vue par rapport à elle meme
            print("View Bounds: \(newViewOptionel!.bounds)")
            
            newlabelOptionel = UILabel(frame: newViewOptionel!.bounds)
            guard newlabelOptionel != nil else { return }
            
            newlabelOptionel?.text = "Hello"
            newViewOptionel?.addSubview(newlabelOptionel!)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let w: CGFloat = 200
        let h: CGFloat = 200
        let frame = CGRect(x: (view.frame.width / 2) - (w / 2),
                           y: (view.frame.height / 2) - (h / 2),
                           width: w,
                           height: h)
        let imgView = CustomImageView(frame: frame)
        view.addSubview(imgView)
         */
        //imgViewCustom.setup("sviatoslav")
        
        header.setup("sviatoslav")
        
        setupView()
    }
    
}
