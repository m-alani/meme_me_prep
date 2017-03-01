//
//  ViewController.swift
//  MemeMe Prep
//
//  Created by Marwan Alani on 2017-02-28.
//  Copyright © 2017 Marwan Alani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    let memeTextAttributes:[String:Any] = [
        NSStrokeColorAttributeName: UIColor.black,
        NSForegroundColorAttributeName: UIColor.white,
        NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName: -3.0]
    
    @IBAction func pickImage(_ sender: Any) {
        let pickController = UIImagePickerController()
        pickController.delegate = self
        pickController.sourceType = .photoLibrary
        self.present(pickController, animated: true, completion: nil)
    }
    
    @IBAction func openCamera(_ sender: Any) {
        let pickController = UIImagePickerController()
        pickController.delegate = self
        pickController.sourceType = .camera
        self.present(pickController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        topTextField.delegate = self
        topTextField.defaultTextAttributes = memeTextAttributes
        topTextField.textAlignment = .center
        bottomTextField.delegate = self
        bottomTextField.defaultTextAttributes = memeTextAttributes
        bottomTextField.textAlignment = .center
        
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imagePickerView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = textField.text == "TOP" ? "" : textField.text
        textField.text = textField.text == "BOTTOM" ? "" : textField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

