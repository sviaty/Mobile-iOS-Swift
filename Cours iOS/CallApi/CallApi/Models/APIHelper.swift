//
//  APIHelper.swift
//  CallApi
//
//  Created by Dufour Sviatoslav on 09/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class APIHelper {
    
    static let get = APIHelper()
    
    func getUserById(_ id: Int, completion: ((User?, Error?) -> Void)?) {
        let baseUrl = "https://api.mergelight.tech/v1/merge-light/"
        let param = "members/\(id)"
        let url = baseUrl + param
        
        if let u = URL(string: url) {
            URLSession.shared.dataTask(with: u) { (d, r, e) in
                if let data = d {
                    print("Data: \(data)")
                    do {
                        let result = try JSONDecoder().decode(UserResponse.self, from: data)
                        //self.user.append(result.data)
                        DispatchQueue.main.async {
                            //self.tableView.reloadData()
                            completion?(result.data, nil)
                        }
                    } catch {
                        print("Error: \(error.localizedDescription)")
                        completion!(nil, error)
                    }
                }
                
                if let response = r {
                    print("Response: \(response)")
                    //completion?(nil, response)
                }
                
                if let error = e {
                    print("Error: \(error.localizedDescription)")
                    completion?(nil, error)
                }
            
            }.resume()
        } else {
            print("Error URL")
        }
    }
}
