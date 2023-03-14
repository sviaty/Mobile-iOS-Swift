//
//  ViewController.swift
//  FaceIDTouchID
//
//  Created by Dufour Sviatoslav on 04/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var secureView: UIView!
    @IBOutlet weak var secureVisualView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        authWithBiometrics()
        
        NotificationCenter.default.addObserver(self, selector: #selector(hide), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(authWithBiometrics), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func hide(){
        secureVisualView.isHidden = false
    }
    
    @objc func authWithBiometrics() {
        if(!secureVisualView.isHidden){
            let context = LAContext()
            let policy: LAPolicy = .deviceOwnerAuthenticationWithBiometrics
            let reason = "Accéder à la photos"
            var error: NSError?
            
            if(context.canEvaluatePolicy(policy, error: &error)) {
                context.evaluatePolicy(policy, localizedReason: reason) { (success, error) in
                    DispatchQueue.main.sync {
                        if let e = error {
                            print("error : \(e.localizedDescription)")
                        }
                        self.secureVisualView.isHidden = success
                        print(success)
                    }
                }
            }
        }
    }
    
}

