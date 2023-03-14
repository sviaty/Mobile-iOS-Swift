//
//  ViewController.swift
//  SaveDatas
//
//  Created by Dufour Sviatoslav on 03/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchBtn: UISwitch!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let arrayKeys = "array"
    let boolKeys = "bool"
    
    var userDefaults = UserDefaults()
    
    var array: [String] = [] {
        didSet {
            if oldValue != array {
                userDefaults.set(array, forKey: arrayKeys)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getArray()
        getBool()
        setupTableView()
        
    }
    
    @IBAction func actionSwitchBtn(_ sender: UISwitch) {
        userDefaults.set(sender.isOn, forKey: boolKeys)
    }
    
    @IBAction func actionTextField(_ sender: Any) {
        
    }
    
    @IBAction func actionSendBtn(_ sender: UIButton) {
        view.endEditing(true)
        if let text = textField.text, text != "" {
            array.append(text)
            //setArray(newArray)
            getArray()
            textField.text = nil
        }
    }
    
    func getBool() {
        let newBool = userDefaults.bool(forKey: boolKeys)
         switchBtn.setOn(newBool, animated: true)
    }
    
    func getArray() {
        if let newArray = userDefaults.array(forKey: arrayKeys) as? [String] {
            array = newArray
            tableView.reloadData()
        }
    }
    
    func setArray(_ newArray: [String]) {
        userDefaults.set(newArray, forKey: arrayKeys)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = array[indexPath.row]
        cell.textLabel?.text = item
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        array.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}

