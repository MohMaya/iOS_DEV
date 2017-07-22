//
//  SecondViewController.swift
//  Firebase Instagram Clone
//
//  Created by Shivanshu Chaudhary on 15/07/17.
//  Copyright © 2017 Shivanshu Chaudhary. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class uploadVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postImage: UIImageView!
    
    
    @IBOutlet weak var postText: UITextView!
    
    
    var uuid = NSUUID().uuidString
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        postImage.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(uploadVC.selectImage))
        postImage.addGestureRecognizer(gestureRecognizer)
    }

    func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        postImage.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func uploadButtonClicked(_ sender: Any) {
        
        let mediaFolder = Storage.storage().reference().child("media")
        if let data = UIImageJPEGRepresentation(postImage.image!, 0.5){
            mediaFolder.child("\(uuid).jpeg").putData(data, metadata: nil, completion: { (metadata, error) in
                if error != nil{
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(ok)
                    self.present(alert, animated: true, completion: nil)
                }else{
                    print(metadata?.downloadURL()?.absoluteString)
                }
            })
        }
        
        
        
    }


}

