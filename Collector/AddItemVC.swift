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
    var model:Model?;
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        titleTextField?.becomeFirstResponder();
        self.addButton?.isEnabled = self.checkForCompleteEntry();
    }
    
    func checkForCompleteEntry() -> Bool {
        if self.titleTextField?.text?.count ?? 0 == 0 {
            return false;
        }
        
        if self.descriptionTextView?.text.count == 0 {
            return false;
        }
        
        if self.imageView?.image == nil {
            return false;
        }
        
        return true;
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
        self.addButton?.isEnabled = self.checkForCompleteEntry();
        return true;
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        self.addButton?.isEnabled = self.checkForCompleteEntry();
        
        if text == "\n" {
            textView.resignFirstResponder();
            self.ratingPicker?.becomeFirstResponder();
            return false
        }
        return true
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.addButton?.isEnabled = self.checkForCompleteEntry();
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil);
        self.addButton?.isEnabled = self.checkForCompleteEntry();
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            picker.dismiss(animated: true, completion: nil);
            return
        }
        
        self.imageView?.image = image;
        
        self.addButton?.isEnabled = self.checkForCompleteEntry();

        picker.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func selectImageButtonPressed(_ sender: Any){
        let imagePicker = UIImagePickerController();
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary;
        imagePicker.allowsEditing = true;
        imagePicker.delegate = self;
        self.present(imagePicker, animated: true, completion: nil);
    }
    
    @IBAction func addItemToCategory(_ sender: Any){
        if self.checkForCompleteEntry(){
            if let itemTitle = self.titleTextField?.text,
                let itemDescription = self.descriptionTextView?.text,
                let itemRating = self.ratingPicker?.selectedRow(inComponent: 0),
                let itemImage = self.imageView?.image{
                    let newItem = Item(title: itemTitle, description: itemDescription, rating: itemRating + 1, image: itemImage);//need to add one since indexpath starts at 0 not 1 :)
                    model?.addItemToCategory(category: &self.currentCategory!, item: newItem);
                    self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
