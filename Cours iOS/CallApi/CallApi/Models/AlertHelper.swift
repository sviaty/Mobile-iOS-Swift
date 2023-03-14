//
//  AlertHelper.swift
//  CallApi
//
//  Created by Dufour Sviatoslav on 09/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class AlertHelper {
    
    static let get = AlertHelper()
    
    func errorAlert(_ string: String, viewController: UIViewController){
        let controller = UIAlertController(title: "Erreur", message: string, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
        controller.addAction(ok)
        viewController.present(controller, animated: true, completion: nil)
    }
}
