//
//  MainViewController.swift
//  UIViewControllerLifeCycle
//
//  Created by Dufour Sviatoslav on 21/02/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var newViewOptionel: UIView?
    var newlabelOptionel: UILabel?
    
    var sender: String?

    @IBAction func goToSecondView(_ sender: Any) {
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
    
    override func loadView() {
        super.loadView()
        print("MainViewController 1 : loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainViewController 1 : viewDidLoad")
        if let datas = sender {
            print("Sender MainView = \(datas)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("MainViewController 1 : viewWillAppear")
    }
    
    // La vue est visible par l'utilisateur
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("MainViewController 1 : viewDidAppear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("MainViewController 1 : didReceiveMemoryWarning")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("MainViewController 1 : viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("MainViewController 1 : viewDidDisappear")
    }

}
