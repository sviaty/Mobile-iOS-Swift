//
//  SecondViewController.swift
//  UIViewControllerLifeCycle
//
//  Created by Dufour Sviatoslav on 21/02/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var sender: String?
    
    @IBAction func goToMainView(_ sender: Any) {
        print("GoToMainView")
        
        let sender = "Hello MainView From SecondView"
        performSegue(withIdentifier: "goToMain", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMain" {
            if let mainController = segue.destination as? MainViewController {
                if let datas = sender as? String {
                    mainController.sender = datas
                }
            }
        }
    }
    
    override func loadView() {
        super.loadView()
        print("SecondViewController 2 : loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondViewController 2 : viewDidLoad")
        
        if let datas = sender {
            print("Sender SecondView = \(datas)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondViewController 2 : viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondViewController 2 : viewDidAppear")
    }
    
    override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
       print("SecondViewController 2 : didReceiveMemoryWarning")
    }
       
    override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       print("SecondViewController 2 : viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
       super.viewDidDisappear(animated)
       print("SecondViewController 2 : viewDidDisappear")
    }
}
