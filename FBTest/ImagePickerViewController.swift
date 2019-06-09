//
//  ImagePickerViewController.swift
//  FBTest
//
//  Created by Ashwin Rajesh on 3/15/19.
//  Copyright © 2019 Ashwin Rajesh. All rights reserved.
//

import UIKit
import Firebase
import CoreGraphics

class ImagePickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Reference to an image file in Firebase Storage
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func selectImage(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imageView.image = selectedImage
        
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveImage(_ sender: UIButton) {
        let storageRef = Storage.storage().reference()
        let imagesRef = storageRef.child("images").child(nameField.text! + ".jpg")
        var data = Data()
        let image = imageView.image!
        data = image.jpegData(compressionQuality: 1.0)!
        
        imagesRef.putData(data, metadata: nil) { (metadata, error) in
            if (error != nil) {
                // Handle error
                return
            }
        }
    
    }
}
