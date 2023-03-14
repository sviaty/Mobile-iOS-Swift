//
//  ButtonViewController.swift
//  Widgets
//
//  Created by Dufour Sviatoslav on 23/02/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {

    @IBOutlet weak var switchBtn: UISwitch!
    
    @IBOutlet weak var labelSwitch: UILabel!
    
    @IBOutlet weak var labelSlider: UILabel!
    
    @IBOutlet weak var labelSegment: UILabel!
    
    @IBOutlet weak var labelStepper: UILabel!
    
    @IBAction func actionBtn(_ sender: UIButton) {
        
    }
    
    
    @IBAction func actionSwiftBtn(_ sender: UISwitch) {
        if(sender.isOn) {
            labelSwitch.text = "On"
        } else {
            labelSwitch.text = "Off"
        }
    }
    
    @IBAction func actionSlider(_ sender: UISlider) {
        labelSlider.text = String(Int(sender.value))
    }
    
    @IBAction func actionSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            labelSegment.text = "Un"
        case 1:
            labelSegment.text = "Deux"
        case 2:
            labelSegment.text = "Trois"
        default:
            return
        }
        
    }
    
    @IBAction func actionStepper(_ sender: UIStepper) {
        labelStepper.text = String(Int(sender.value))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
