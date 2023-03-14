//
//  ViewController.swift
//  DownloadImage
//
//  Created by Dufour Sviatoslav on 04/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageUrlHttps = "https://mergelight.fr/assets/logo/logotest2.png"
    var imageUrlHttp = "http://dufour-sviatoslav.fr/assets/images/favicon/favicon-32x32.png"
    
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionHttps(_ sender: UIButton) {
        requestImageFrom(imageUrlHttps)
    }
    
    @IBAction func actionHttp(_ sender: UIButton) {
        requestImageFrom(imageUrlHttp)
    }
    
    func requestImageFrom(_ urlString: String){
        showLoad()
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) {
                (data, response, error) in
                
                DispatchQueue.main.sync {
                    if let d = data {
                        print("data : \(d)")
                        let image = UIImage(data: d)
                        self.imageView.image = image
                    }
                    if let r = response {
                        print("response : \(r)")
                    }
                    if let e = error {
                        print("error : \(e.localizedDescription)")
                    }
                    self.hideLoad()
                }
                
            }.resume()
        }
    }
    
    func showLoad() {
        loadIndicator.isHidden = false
        loadIndicator.startAnimating()
    }
    
    func hideLoad() {
        loadIndicator.isHidden = true
        loadIndicator.stopAnimating()
    }
}

