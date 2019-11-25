//
//  AddItemVC.swift
//  Collector
//
//  Created by Albert Gedeon on 11/22/19.
//  Copyright © 2019 Albert Gedeon. All rights reserved.
//

import Foundation
import UIKit

class AddItemVC:UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var titleTextField:UITextField?;
    @IBOutlet weak var descriptionTextView:UITextView?;
    @IBOutlet weak var ratingPicker:UIPickerView?;
    @IBOutlet weak var addButton:UIBarButtonItem?;
    @IBOutlet weak var imageView:UIImageView?;
    
    var currentCategory:Category?;
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        titleTextField?.becomeFirstResponder();
//        self.addButton?.isEnabled = false;
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return 5;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return String(row + 1);
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.descriptionTextView?.becomeFirstResponder();
        return true;
    }
    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if text == "\n" {
//            textView.resignFirstResponder();
//            self.ratingPicker?.becomeFirstResponder();
//            return false
//        }
//        return true
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//
//    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil);
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            picker.dismiss(animated: true, completion: nil);
            return
        }
        
        self.imageView?.image = image;

        picker.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func selectImageButtonPressed(_ sender: Any){
        let imagePicker = UIImagePickerController();
        imagePicker.sourceType = .camera;
        imagePicker.allowsEditing = true;
        imagePicker.delegate = self;
        self.present(imagePicker, animated: true, completion: nil);
    }
    
    @IBAction func addItemToCategory(_ sender: Any){
        
    }
}
