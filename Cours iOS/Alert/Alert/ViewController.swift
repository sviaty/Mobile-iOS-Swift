//
//  ViewController.swift
//  Alert
//
//  Created by Dufour Sviatoslav on 03/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnActionSheet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionShowAlert(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Alert", message: "Message alert", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            print("Ok alert")
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Cancel alert")
        }
        
        alertController.addAction(action)
        alertController.addAction(actionCancel)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func actionShowAlertActionSheet(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Alert", message: "Message alert", preferredStyle: .actionSheet)
        
        let white = UIAlertAction(title: "White", style: .default) { (action) in
            print("White alert")
        }
        let red = UIAlertAction(title: "Red", style: .default) { (action) in
            print("Red alert")
        }
        let blue = UIAlertAction(title: "Blue", style: .default) { (action) in
            print("Blue alert")
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Cancel alert")
        }
            
        alertController.addAction(white)
        alertController.addAction(red)
        alertController.addAction(blue)
        alertController.addAction(cancel)
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            alertController.popoverPresentationController?.sourceView = self.btnActionSheet
            present(alertController, animated: true, completion: nil)
        } else {
            present(alertController, animated: true, completion: nil)
        }
    }
    
}

