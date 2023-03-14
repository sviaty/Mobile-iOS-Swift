//
//  ViewController.swift
//  NavigationView
//
//  Created by Dufour Sviatoslav on 22/02/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToSecond(_ sender: Any) {
        print("GoToSecondView")
        
        let sender = "Hello SecondView From MainView"
        performSegue(withIdentifier: "goToSecond", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare goToSecond")
        if segue.identifier == "goToSecond" {
            if let secondController = segue.destination as? SecondViewController {
                if let datas = sender as? String {
                    secondController.sender = datas
                }
            }
        }
    }
    
}

