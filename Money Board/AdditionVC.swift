//
//  AdditionVC.swift
//  Money Board
//
//  Created by Antonius George on 08/05/18.
//  Copyright © 2018 Apple Developer Academy @ Binus. All rights reserved.
//

import UIKit

class AdditionVC: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var newImageBoard: UIImageView!
    
    @IBOutlet weak var newWord: UITextField!
    
    
    let data = DataStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add New Board"

        // Do any additional setup after loading the view.
        let addButton = UIBarButtonItem(barButtonSystemItem:  .done, target: self, action: #selector(done))
        
        self.navigationItem.rightBarButtonItem = addButton
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func done(){
        if (!(newWord.text?.isEmpty)! && !(newImageBoard.image?.isEqual(nil))!){
            
            print("Add Image")
            data.mainBoardImage.append(newImageBoard.image!)
            
            
            print("Add Text")
            data.mainBoardText.append(newWord.text!)
            
            print("Add AddSubBoard")
            data.subBoardImage.updateValue([newImageBoard.image!], forKey: newWord.text!)
            
            
           
            
            print("Dismissing Self V2")
            self.navigationController?.popViewController(animated: true)
        
        }else{
            let alert = UIAlertController(title: "Oops", message: "Please Fill the image and the Keyword", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func clickedOnImageView(_ sender: UITapGestureRecognizer) {
        print("Clicked Image")
        
        
        // Hide the keyboard.
        newWord.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    
    
    
  
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        newImageBoard.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    

    

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
