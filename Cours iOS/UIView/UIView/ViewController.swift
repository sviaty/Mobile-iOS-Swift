//
//  ViewController.swift
//  UIView
//
//  Created by Dufour Sviatoslav on 10/02/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var centerText: UILabel!
    
    @IBOutlet weak var gaelleImg: UIImageView!
    @IBOutlet weak var heartImgView: UIImageView!
    @IBOutlet weak var btnView: UIButton!
    
    @IBOutlet var stackButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
        //UIView
        topView.backgroundColor = .purple
        centerView.backgroundColor = .purple
        bottomView.backgroundColor = .purple
        
        // UILabel
        centerText.text = "Hello Sviatoslav"
        
        // UIImageView
        gaelleImg.image = UIImage(named: "gaelle")
        gaelleImg.backgroundColor = .gray
        gaelleImg.layer.cornerRadius = 50
        heartImgView.image = UIImage(systemName: "heart")
        
        // UIButton
        btnView.layer.cornerRadius = 5
        stackButtons.forEach { (button) in button.backgroundColor = .green
            button.layer.cornerRadius = 5
            button.setTitleColor(.black, for: .normal)
        }
        
        // Désactive les evenements sur le bouton
        // btnView.isUserInteractionEnabled = false
        
        // Activer le btn
        btnView.isEnabled = true
        
        centerText.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapLabel))
        centerText.addGestureRecognizer(tap)
        
        gaelleImg.isUserInteractionEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let first = touches.first {
            if(first.view == gaelleImg){
                print("Touch img")
            }
        }
    }
    
    @objc func tapLabel(){
        print("Touch Label")
    }
    
    @IBAction func touchCenterAction(_ sender: Any) {
        print("Touch Button Center")
    }
    
    @IBAction func touchReturnAction(_ sender: UIButton) {
        //print("Touch Button")
        if(sender.tag == 1){
            print("Touch Button Return")
        } else if(sender.tag == 2) {
            print("Touch Button Send")
        }
    }

    
}

