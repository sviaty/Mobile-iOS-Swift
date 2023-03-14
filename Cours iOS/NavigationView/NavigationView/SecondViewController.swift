//
//  SecondViewController.swift
//  NavigationView
//
//  Created by Dufour Sviatoslav on 22/02/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var sender: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let datas = sender {
            print("Sender SecondView = \(datas)")
        }
    }
}
