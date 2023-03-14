//
//  PickerViewController.swift
//  Widgets
//
//  Created by Dufour Sviatoslav on 23/02/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var labelDatePicker: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var labelPickerView: UILabel!
    
    var arrayPicker = ["Apple", "Android"]
    
    @IBAction func actionDatePicker(_ sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "fr_FR")
        
        dateFormatter.dateFormat = "dd/MM/yyyy - hh:mm"
        
        let str = dateFormatter.string(from: sender.date)
        
        labelDatePicker.text = str
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayPicker[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelPickerView.text = arrayPicker[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
}
