//
//  ViewController.swift
//  CallApi
//
//  Created by Dufour Sviatoslav on 09/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var user: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        APIHelper.get.getUserById(60) { (user, error) in
            if let e = error {
                print("Error: \(e.localizedDescription)")
                AlertHelper.get.errorAlert(e.localizedDescription, viewController: self)
            } else {
                if let u = user {
                    self.user.append(u)
                    self.tableView.reloadData()
                }
                
            }
            
        }
    }
    
    /*
    func getUserById(_ id: Int){
        let baseUrl = "https://api.mergelight.tech/v1/merge-light/"
        let param = "members/\(id)"
        let url = baseUrl + param
        
        if let u = URL(string: url) {
            URLSession.shared.dataTask(with: u) { (d, r, e) in
                if let data = d {
                    print("Data: \(data)")
                    do {
                        let result = try JSONDecoder().decode(UserResponse.self, from: data)
                        self.user.append(result.data)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } catch {
                        print("Error: \(error.localizedDescription)")
                    }
                }
                
                if let response = r {
                     print("Response: \(response)")
                }
                
                if let error = e {
                    print("Error: \(error.localizedDescription)")
                }
            
            }.resume()
        } else {
            print("Error URL")
        }
    }
    */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UserTableViewCell {
            cell.user = user[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }


}


