//
//  TableViewController.swift
//  TableView
//
//  Created by Dufour Sviatoslav on 28/02/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

struct SectionTable {
    var name : String
    var array : [Personne]
}

class TableViewController: UITableViewController {

    var garcon: [Personne] = [
        Personne(name: "Sviatoslav", age: 18),
        Personne(name: "Igor", age: 25)
    ]
    var fille: [Personne] = [
        Personne(name: "Svetlana", age: 30)
    ]
    var section: [SectionTable] = []
    
    var systemList = ["Windows","OSx","Linux"]
    var systemListDetail = ["Windows system","OSx system","Linux system"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //systemList = getDatas()
        getSection()
        tableView.reloadData()
    }
    
    func getSection() {
        section = [
            SectionTable(name: "Garcon", array: garcon),
            SectionTable(name: "Fille", array: fille)
        ]
    }
    
    func getDatas() -> [String] {
        return ["Windows","OSx","Linux"]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return section.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let indexSection = self.section[section].array
        return indexSection.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let personne = section[indexPath.section].array[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "detail") as? CustomTableViewCell {
            
            cell.personne = personne

            return cell
        } else {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)

            let color = section[indexPath.section].name == "Garcon" ? UIColor.systemTeal : UIColor.systemPink
           
            cell.textLabel?.text = section[indexPath.section].array[indexPath.row].name
            cell.detailTextLabel?.text = section[indexPath.section].name
            cell.detailTextLabel?.textColor = color
           
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            section[indexPath.section].array.remove(at: indexPath.row)
            //systemList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        section[fromIndexPath.section].array.remove(at: fromIndexPath.row)
        section[to.section].array.insert(
            section[fromIndexPath.section].array[fromIndexPath.row],
            at: to.row)
        //systemList.remove(at: fromIndexPath.row)
        //systemList.insert(systemList[fromIndexPath.row], at: to.row)

    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section].name
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let rect = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50)
        let view = UIView(frame: rect)
        view.backgroundColor = .orange
        
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    /*
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return self.section[section].name
    }
    */
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
