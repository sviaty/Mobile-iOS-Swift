//
//  ViewController.swift
//  CoreML
//
//  Created by Dufour Sviatoslav on 09/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var catLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var launchMl: UIButton!
    
    var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        launchMl.isEnabled = false
        picker.delegate = self
        picker.allowsEditing = false
    }

    @IBAction func actionCam(_ sender: Any) {
        setupCamera()
    }
    
    @IBAction func actionCoreML(_ sender: Any) {
        
    }
    
    func setupCamera() {
        let controller = UIAlertController(title: "Choisir une image", message: "Photo oou gallerie ?", preferredStyle: .alert)
        let photo = UIAlertAction(title: "Appareil photo", style: .default) { (action) in
            self.picker.sourceType = .camera
            self.present(self.picker, animated: true, completion: nil)
        }
        
        let gallerie = UIAlertAction(title: "Gallerie photo", style: .default) { (action) in
            self.picker.sourceType = .photoLibrary
            self.present(self.picker, animated: true, completion: nil)
        }
        
        if(UIImagePickerController.isSourceTypeAvailable(.camera)) {
            controller.addAction(photo)
        }
        
        controller.addAction(gallerie)
        present(controller, animated: true, completion: nil)
        
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            self.imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

