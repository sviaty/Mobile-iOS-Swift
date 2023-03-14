//
//  InputViewController.swift
//  Widgets
//
//  Created by Dufour Sviatoslav on 23/02/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var mailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    
    @IBAction func nameTFDidEnd(_ sender: Any) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tap)
        nameTF.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @objc func closeKeyboard(){
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Did End Protocol: \(String(describing: textField.text))")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Did Begin Protocol: \(String(describing: textField.text))")
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("Did Change Protocol: \(String(describing: textField.text))")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("Should Clear Protocol: \(String(describing: textField.text))")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Sould Return Protocol: \(String(describing: textField.text))")
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("Sould End Protocol: \(String(describing: textField.text))")
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Sould Begin Protocol: \(String(describing: textField.text))")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("Did End Reason Protocol: \(String(describing: textField.text))")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("Field Protocol: \(String(describing: textField.text))")
        return true
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
