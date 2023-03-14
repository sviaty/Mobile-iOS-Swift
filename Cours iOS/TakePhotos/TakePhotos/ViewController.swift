//
//  ViewController.swift
//  TakePhotos
//
//  Created by Dufour Sviatoslav on 03/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var camBtn: UIButton!
    @IBOutlet weak var photoBtn: UIButton!
    
    var picker: UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.allowsEditing = true
    }

    @IBAction func actionPhotoCam(_ sender: Any) {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            present(picker, animated: true, completion: nil)
        } else {
            print("pas de camera")
        }
    }
    
    @IBAction func actionPhotoGalerie(_ sender: Any) {
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        /*
        if let photo = info[.originalImage] as? UIImage {
            imageView.image = photo
        }
        */
        
        if let photo = info[.editedImage] as? UIImage {
            imageView.image = photo
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
}

